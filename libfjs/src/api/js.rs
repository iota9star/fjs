use crate::api::value::JsValue;
use crate::js::{setup_basics, setup_console};
use anyhow::anyhow;
use flutter_rust_bridge::{frb, DartFnFuture};
use rquickjs::loader::{
    BuiltinLoader, BuiltinResolver, FileResolver, ModuleLoader, NativeLoader, ScriptLoader,
};

use rquickjs::{async_with, CatchResultExt, FromJs, Promise};
use tokio::io::AsyncReadExt;

#[frb(opaque)]
pub struct MemoryUsage(rquickjs::qjs::JSMemoryUsage);

macro_rules! proxy_memory_usage_getter {
    ($($name:ident),+) => {
        impl MemoryUsage {
            $(
                #[frb(sync, getter)]
                pub fn $name(&self) -> i64 { self.0.$name }
            )+
        }
    };
}

proxy_memory_usage_getter!(
    malloc_size,
    malloc_limit,
    memory_used_size,
    malloc_count,
    memory_used_count,
    atom_count,
    atom_size,
    str_count,
    str_size,
    obj_count,
    obj_size,
    prop_count,
    prop_size,
    shape_count,
    shape_size,
    js_func_count,
    js_func_size,
    js_func_code_size,
    js_func_pc2line_count,
    js_func_pc2line_size,
    c_func_count,
    array_count,
    fast_array_count,
    fast_array_elements,
    binary_object_count,
    binary_object_size
);

#[frb(opaque)]
pub struct JsRuntime(rquickjs::Runtime);

impl JsRuntime {
    #[frb(sync)]
    pub fn new() -> anyhow::Result<Self> {
        let runtime = rquickjs::Runtime::new()?;
        Ok(Self(runtime))
    }

    #[frb(sync)]
    pub fn set_memory_limit(&self, limit: usize) {
        self.0.set_memory_limit(limit);
    }
    #[frb(sync)]
    pub fn set_max_stack_size(&self, limit: usize) {
        self.0.set_max_stack_size(limit);
    }
    #[frb(sync)]
    pub fn set_gc_threshold(&self, threshold: usize) {
        self.0.set_gc_threshold(threshold);
    }
    #[frb(sync)]
    pub fn run_gc(&self) {
        self.0.run_gc();
    }
    #[frb(sync)]
    pub fn memory_usage(&self) -> MemoryUsage {
        let usage = self.0.memory_usage();
        MemoryUsage(usage)
    }
    #[frb(sync)]
    pub fn is_job_pending(&self) -> bool {
        self.0.is_job_pending()
    }
    #[frb(sync)]
    pub fn execute_pending_job(&self) -> anyhow::Result<bool> {
        self.0.execute_pending_job().map_err(|e| anyhow!(e))
    }
    #[frb(sync)]
    pub fn set_dump_flags(&self, flags: u64) {
        self.0.set_dump_flags(flags);
    }
    #[frb(sync)]
    pub fn set_info(&self, info: String) -> anyhow::Result<()> {
        self.0.set_info(info)?;
        Ok(())
    }
}

#[frb(opaque)]
pub struct JsAsyncRuntime(rquickjs::AsyncRuntime);

impl JsAsyncRuntime {
    #[frb(sync)]
    pub fn new() -> anyhow::Result<Self> {
        let runtime = rquickjs::AsyncRuntime::new()?;
        Ok(Self(runtime))
    }

    pub async fn set_builtin_modules(&self, modules: Vec<JsBuiltinModule>) -> anyhow::Result<()> {
        let mut builtin_resolver = BuiltinResolver::default();
        let mut builtin_loader = BuiltinLoader::default();
        for module in modules {
            match module {
                JsBuiltinModule::Code(module, code) => {
                    builtin_resolver = builtin_resolver.with_module(&module);
                    builtin_loader = builtin_loader.with_module(&module, code);
                }
                JsBuiltinModule::Path(module, path) => {
                    let mut f = tokio::fs::File::open(&path).await?;
                    let mut codes = String::new();
                    f.read_to_string(&mut codes).await?;
                    builtin_resolver = builtin_resolver.with_module(&module);
                    builtin_loader = builtin_loader.with_module(&module, codes);
                }
            }
        }
        let resolver = (builtin_resolver, FileResolver::default());
        let loader = (
            builtin_loader,
            ModuleLoader::default(),
            NativeLoader::default(),
            ScriptLoader::default(),
        );
        self.0.set_loader(resolver, loader).await;
        Ok(())
    }

    pub async fn set_memory_limit(&self, limit: usize) {
        self.0.set_memory_limit(limit).await;
    }

    pub async fn set_max_stack_size(&self, limit: usize) {
        self.0.set_max_stack_size(limit).await;
    }

    pub async fn set_gc_threshold(&self, threshold: usize) {
        self.0.set_gc_threshold(threshold).await;
    }

    pub async fn run_gc(&self) {
        self.0.run_gc().await;
    }

    pub async fn memory_usage(&self) -> MemoryUsage {
        let usage = self.0.memory_usage().await;
        MemoryUsage(usage)
    }

    pub async fn is_job_pending(&self) -> bool {
        self.0.is_job_pending().await
    }

    pub async fn execute_pending_job(&self) -> anyhow::Result<bool> {
        self.0.execute_pending_job().await.map_err(|e| anyhow!(e))
    }

    pub async fn idle(&self) {
        self.0.idle().await;
    }

    pub async fn set_info(&self, info: String) -> anyhow::Result<()> {
        self.0.set_info(info).await?;
        Ok(())
    }
}

#[frb(opaque)]
pub struct JsContext(rquickjs::Context);

impl JsContext {
    #[frb(sync)]
    pub fn new(rt: &JsRuntime) -> anyhow::Result<Self> {
        let context = rquickjs::Context::full(&rt.0)?;
        Ok(Self(context))
    }
    #[frb(sync)]
    pub fn eval(&self, code: String) -> JsResult {
        self.eval_with_options(code, JsEvalOptions::new())
    }
    #[frb(sync)]
    pub fn eval_with_options(&self, code: String, options: JsEvalOptions) -> JsResult {
        if options.promise {
            return JsResult::Err("Promise not supported in sync context".to_string());
        }
        self.0.with(|ctx| {
            if let Err(e) = setup_console(&ctx) {
                return JsResult::Err(e.to_string());
            }
            let res = ctx.eval_with_options(code, options.into());
            JsResult::from_result(&ctx, res)
        })
    }
    #[frb(sync)]
    pub fn eval_file(&self, path: String) -> JsResult {
        self.eval_file_with_options(path, JsEvalOptions::new())
    }

    #[frb(sync)]
    pub fn eval_file_with_options(&self, path: String, options: JsEvalOptions) -> JsResult {
        if options.promise {
            return JsResult::Err("Promise not supported in sync context".to_string());
        }
        self.0.with(|ctx| {
            if let Err(e) = setup_console(&ctx) {
                return JsResult::Err(e.to_string());
            }
            let res = ctx.eval_file_with_options(path, options.into());
            JsResult::from_result(&ctx, res)
        })
    }
}

#[frb(opaque)]
pub struct JsAsyncContext(rquickjs::AsyncContext);

impl JsAsyncContext {
    pub async fn from(rt: &JsAsyncRuntime) -> anyhow::Result<Self> {
        let context = rquickjs::AsyncContext::full(&rt.0).await?;
        Ok(Self(context))
    }

    pub async fn eval(&self, code: String) -> JsResult {
        self.eval_with_options(code, JsEvalOptions::new()).await
    }

    pub async fn eval_with_options(&self, code: String, options: JsEvalOptions) -> JsResult {
        async_with!(self.0 => |ctx| {
            if let Err(e) = setup_basics(&ctx){
                return JsResult::Err(e.to_string());
            }
            let mut options = options;
            options.promise = true;
            let res = ctx.eval_with_options(code, options.into());
            JsResult::from_promise_result(&ctx, res).await
        })
        .await
    }

    pub async fn eval_file(&self, path: String) -> JsResult {
        self.eval_file_with_options(path, JsEvalOptions::new())
            .await
    }

    pub async fn eval_file_with_options(&self, path: String, options: JsEvalOptions) -> JsResult {
        async_with!(self.0 => |ctx| {
            if let Err(e) = setup_basics(&ctx){
                return JsResult::Err(e.to_string());
            }
            let mut options = options;
            options.promise = true;
            let res = ctx.eval_file_with_options(path, options.into());
            JsResult::from_promise_result(&ctx, res).await
        })
        .await
    }

    pub async fn eval_function(
        &self,
        module: String,
        method: String,
        params: Option<Vec<JsValue>>,
    ) -> JsResult {
        let params = params.unwrap_or_default();
        async_with!(self.0 => |ctx| {
            if let Err(e) = setup_basics(&ctx){
                return JsResult::Err(e.to_string());
            }
            let v = rquickjs::Module::import(&ctx, module.clone());
            if v.is_err() {
                return JsResult::Err(v.unwrap_err().to_string());
            }
            match v.catch(&ctx) {
                Ok(promise) => {
                    match promise.into_future::<rquickjs::Value>().await {
                        Ok(v) => {
                            if !v.is_object() {
                                return JsResult::Err(format!("Is the module({}) registered correctly?", &module));
                            }
                            let obj = v.as_object().unwrap();
                            let m: rquickjs::Result<rquickjs::Value> = obj.get(&method);
                            match m {
                                Ok(m) => {
                                    return if m.is_function() {
                                        let func = m.as_function().unwrap();
                                        let res = func.call((rquickjs::function::Rest(params),));
                                        JsResult::from_promise_result(&ctx, res).await
                                    } else {
                                        JsResult::Err(format!("Method `{}` not found in the module({}).", &method, &module))
                                    }
                                }
                                Err(e) => {
                                    JsResult::Err(e.to_string())
                                }
                            }
                        }
                        Err(e) => {
                            JsResult::Err(e.to_string())
                        }
                    }
                }
                Err(e) =>  JsResult::Err(e.to_string())
            }
        })
            .await
    }

    // pub async fn run<'js>(&self, invoke: impl Fn(JsCtx<'js>) -> DartFnFuture<()>) {
    //     async_with!(self.0 => |ctx| {
    //         invoke(JsCtx(ctx)).await;
    //     })
    //     .await
    // }
}

#[frb(opaque)]
pub struct JsCtx<'js>(rquickjs::Ctx<'js>);

impl<'js> JsCtx<'js> {
    fn new(ctx: &rquickjs::Ctx) -> Self {
        Self(ctx.clone())
    }

    #[frb(sync)]
    pub fn eval(&self, code: String) -> JsResult {
        self.eval_with_options(code, JsEvalOptions::new())
    }

    #[frb(sync)]
    pub fn eval_with_options(&self, code: String, options: JsEvalOptions) -> JsResult {
        if options.promise {
            return JsResult::Err("Promise not supported in sync context".to_string());
        }
        let result = self.0.eval_with_options(code, options.into());
        JsResult::from_result(&self.0, result)
    }

    pub async fn eval_promise(&self, code: String) -> JsResult {
        self.eval_promise_with_options(code, JsEvalOptions::new())
    }

    pub async fn eval_promise_with_options(
        &self,
        code: String,
        options: JsEvalOptions,
    ) -> JsResult {
        let result = self.0.eval_with_options(code, options.into());
        JsResult::from_promise_result(&self.0, result).await
    }

    #[frb(sync)]
    pub fn eval_file(&self, path: String) -> JsResult {
        self.eval_file_with_options(path, JsEvalOptions::new())
    }

    #[frb(sync)]
    pub fn eval_file_with_options(&self, path: String, options: JsEvalOptions) -> JsResult {
        if options.promise {
            return JsResult::Err("Promise not supported in sync context".to_string());
        }
        let result = self.0.eval_file_with_options(path, options.into());
        JsResult::from_result(&self.0, result)
    }
}

#[frb(opaque)]
pub struct JsModule<'js>(rquickjs::Module<'js>);

impl JsModule {
    pub fn declare(ctx: JsCtx, name: String, source: String) -> anyhow::Result<Self> {
        let module = rquickjs::Module::declare(ctx.0, name, source)?;
        Ok(Self(module))
    }

    pub async fn evaluate(ctx: JsCtx, name: String, source: String) -> JsResult {
        let promise = rquickjs::Module::evaluate(ctx.0.clone(), name, source);
        JsResult::from_promise_result(&ctx.0, promise).await
    }
}

#[derive(Debug)]
#[frb(dart_metadata = ("freezed", "immutable"), dart_code = "
  bool get isOk => this is JsResult_Ok;
  bool get isErr => this is JsResult_Err;
  JsValue get ok => (this as JsResult_Ok).field0;
  String get err => (this as JsResult_Err).field0;
")]
pub enum JsResult {
    Ok(JsValue),
    Err(String),
}

impl JsResult {
    async fn from_promise_result<'js>(
        ctx: &rquickjs::Ctx<'js>,
        res: rquickjs::Result<Promise<'js>>,
    ) -> Self {
        if res.is_err() {
            return JsResult::Err(res.unwrap_err().to_string());
        }
        match res.catch(ctx) {
            Ok(promise) => match promise.into_future::<rquickjs::Value>().await {
                Ok(v) => match JsValue::from_js(ctx, v) {
                    Ok(v) => JsResult::Ok(v),
                    Err(e) => JsResult::Err(e.to_string()),
                },
                Err(e) => JsResult::Err(e.to_string()),
            },
            Err(e) => JsResult::Err(e.to_string()),
        }
    }

    fn from_result<'js>(
        ctx: &rquickjs::Ctx<'js>,
        res: rquickjs::Result<rquickjs::Value<'js>>,
    ) -> Self {
        res.catch(ctx)
            .map(|v| JsValue::from_js(ctx, v))
            .map_or_else(
                |e| JsResult::Err(e.to_string()),
                |v| match v {
                    Ok(v) => JsResult::Ok(v),
                    Err(e) => JsResult::Err(e.to_string()),
                },
            )
    }
}

#[frb(dart_metadata = ("freezed", "immutable"))]
pub struct JsEvalOptions {
    /// Global code.
    pub global: bool,
    /// Force 'strict' mode.
    pub strict: bool,
    /// Don't include the stack frames before this eval in the Error() backtraces.
    pub backtrace_barrier: bool,
    /// Support top-level-await.
    pub promise: bool,
}

impl JsEvalOptions {
    #[frb(sync)]
    pub fn new() -> Self {
        JsEvalOptions {
            global: true,
            strict: true,
            backtrace_barrier: false,
            promise: false,
        }
    }
    fn into(self) -> rquickjs::context::EvalOptions {
        let mut opts = rquickjs::context::EvalOptions::default();
        opts.global = self.global;
        opts.strict = self.strict;
        opts.backtrace_barrier = self.backtrace_barrier;
        opts.promise = self.promise;
        opts
    }
}

#[frb(dart_metadata = ("freezed", "immutable"))]
#[derive(Debug, Clone, Hash, Eq, PartialEq, Ord, PartialOrd)]
pub enum JsBuiltinModule {
    Code(String, String),
    Path(String, String),
}

impl JsBuiltinModule {
    #[frb(sync)]
    pub fn new(module: String, code: Option<String>, path: Option<String>) -> anyhow::Result<Self> {
        match (code, path) {
            (Some(code), None) => Ok(Self::Code(module, code)),
            (None, Some(path)) => Ok(Self::Path(module, path)),
            _ => Err(anyhow!(
                "Module({}) must have either a path or code",
                module
            )),
        }
    }
    #[frb(sync)]
    pub fn from_code(module: String, code: String) -> Self {
        Self::Code(module, code)
    }
    #[frb(sync)]
    pub fn from_path(module: String, path: String) -> Self {
        Self::Path(module, path)
    }
}

#[cfg(test)]
mod test {
    use crate::api::js::{JsAsyncContext, JsAsyncRuntime, JsBuiltinModule};
    use crate::api::value::JsValue;

    #[tokio::test]
    async fn test() {
        env_logger::builder()
            .filter_level(log::LevelFilter::Trace)
            .init();
        let rt = JsAsyncRuntime::new().unwrap();
        let ctx = JsAsyncContext::from(&rt).await.unwrap();
        rt.set_builtin_modules(vec![JsBuiltinModule::Code("test".to_string(),  // language=javascript
                                                  r#"
            export async function test(){
                console.log(arguments);
                console.debug(arguments);
                console.warn(arguments);
                console.error(arguments);
                console.log(JSON.stringify(arguments));
                console.log(await fetch('https://www.google.com/').then((res) => res.text()));
                // console.log(await fetch('https://www.baidu.com/').then((res) => res.text()));
                console.log(await fetch('https://httpbin.org/get').then((res) => res.json()));
                console.log(await fetch('https://httpbin.org/get').then((res) => res.text()));
                console.log(await fetch('https://httpbin.org/get').then((res) => res.arrayBuffer()).then((a) => a.byteLength));
                console.log(await fetch('https://httpbin.org/post', { method: 'POST'}).then((res) => res.json()));
                console.log(await fetch('https://httpbin.org/put', { method: 'PUT'}).then((res) => res.json()));
                console.log(await fetch('https://httpbin.org/patch', { method: 'PATCH'}).then((res) => res.json()));
                console.log(await fetch('https://httpbin.org/delete', { method: 'DELETE'}).then((res) => res.json()));
                console.log(await fetch('https://httpbin.org/post', { method: 'POST', headers: { "content-TYPE": "application/x-www-form-urlencoded" }, body: { hello: "world" } }).then((res) => res.json()));
                console.log(await fetch('https://httpbin.org/post', { method: 'POST', headers: { "content-TYPE": "application/x-www-form-urlencoded" }, body: "hello=world" }).then((res) => res.json()));
                console.log(await fetch('https://httpbin.org/post', { method: 'POST', body: { hello: "world" } }).then((res) => res.json()));
                console.log(await fetch('https://httpbin.org/post', { method: 'POST', body: ["hello", "world"] }).then((res) => res.json()));
                console.log(await fetch('https://httpbin.org/post', { method: 'POST', body: JSON.stringify({ hello: "world" }) }).then((res) => res.json()));
                return arguments;
            }
            "#.to_string(), )]).await.unwrap();
        let r = ctx
            .eval_function(
                "test".to_string(),
                "test".to_string(),
                Some(vec![JsValue::Array(vec![
                    JsValue::String("hello".to_string()),
                    JsValue::String("world".to_string()),
                ])]),
            )
            .await;
        println!("{:?}", r);
    }
    // #[tokio::test]
    // async fn test2() {
    //     let engine = JsEngine::new(Some(vec![JsModule {
    //         name: "test".to_string(),
    //         code: Some("export async function test(){ return arguments; }".to_string()),
    //         path: None,
    //     }]))
    //         .await
    //         .unwrap();
    //     // engine.register_runtime_module(JsModule {
    //     //     name: "test".to_string(),
    //     //     code: Some("export async function test(){ return [2]; }".to_string()),
    //     //     path: None,
    //     // });
    //     let v = engine
    //         .call_method("test".to_string(), "test".to_string(), None)
    //         .await;
    //     println!("{:?}", v);
    // }
    // #[tokio::test]
    // async fn test3() {
    //     setup().await.unwrap();
    //     let engine = JsEngine::new(Some(vec![JsModule {
    //         name: "test".to_string(),
    //         code: Some("export async function test(){ return arguments; }".to_string()),
    //         path: None,
    //     }]))
    //         .await
    //         .unwrap();
    //     // engine.register_runtime_module(JsModule {
    //     //     name: "test".to_string(),
    //     //     code: Some("export async function test(){ return [2]; }".to_string()),
    //     //     path: None,
    //     // });
    //     let v = engine
    //         .call_method("test".to_string(), "test".to_string(), None)
    //         .await;
    //     println!("{:?}", v);
    //     // engine.remove_runtime_module("test".to_string());
    //     let v = engine
    //         .call_method("test".to_string(), "test".to_string(), None)
    //         .await;
    //     println!("{:?}", v);
    // }
    #[tokio::test]
    async fn test4() {
        let rt = JsAsyncRuntime::new().unwrap();
        let context = JsAsyncContext::from(&rt).await.unwrap();
    }
}
