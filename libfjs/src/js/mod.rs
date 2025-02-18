use tokio::io::AsyncReadExt;
mod console;
mod fetch;
mod value;

pub use console::setup_console;
pub use fetch::setup_fetch;

pub fn setup_basics(ctx: &rquickjs::Ctx) -> anyhow::Result<()> {
    setup_console(ctx)?;
    setup_fetch(ctx)?;
    Ok(())
}
