import 'package:fjs/fjs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  await LibFjs.init();
  runApp(const MyApp());
}

const codes =
// language=js
    """
export async function test(){
                console.log(arguments);
                console.debug(arguments);
                console.warn(arguments);
                console.error(arguments);
                console.log(JSON.stringify(arguments));
                console.log(await fetch('https://www.google.com/').then((res) => res.text()));
                console.log(await fetch('https://www.baidu.com/').then((res) => res.text()));
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
    """;
final jsCtx = (() async {
  final test = await rootBundle.loadString("assets/test.js");
  final rt = JsAsyncRuntime();
  await rt.setModules(modules: [
    JsModule.code("test", test),
    const JsModule.code("test2", codes),
  ]);
  return JsAsyncContext.from(rt: rt);
})();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  final ctx = await jsCtx;
                  ctx.eval(code: "1n+1n").then((value) => print(value));
                  ctx.evalFunction(module: "test", method: "price", params: [
                    JsValue.from(
                        "JUPyiwrYJFskUPiHa7hkeR8VUtAeFoSYbKedZNsDvCN,So11111111111111111111111111111111111111112"
                            .split(","))
                  ]).then((value) => print(value.ok.value));
                  ctx.evalFunction(module: 'test2', method: 'test')
                      .then((value) => print(value));
                },
                child: Text("fetch")),
          ],
        ),
      ),
    );
  }
}
