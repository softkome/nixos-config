mod release;
mod system;
mod uptime;

use crate::release::{get_os_pretty_name, get_system_info};
use crate::system::{get_root_disk_usage, get_username_and_hostname};
use crate::uptime::get_current;
use std::io::{Write, stdout};

fn main() -> Result<(), Box<dyn std::error::Error>> {
    if Some("--version") == std::env::args().nth(1).as_deref() {
        println!("Microfetch {}", env!("CARGO_PKG_VERSION"));
    } else {
        let utsname = nix::sys::utsname::uname()?;
        let fields = Fields {
            user_info: get_username_and_hostname(&utsname),
            os_name: get_os_pretty_name()?,
            kernel_version: get_system_info(&utsname),
            uptime: get_current()?,
            storage: get_root_disk_usage()?,
        };
        print_system_info(&fields)?;
    }

    Ok(())
}

struct Fields {
    user_info: String,
    os_name: String,
    kernel_version: String,
    uptime: String,
    storage: String,
}

fn print_system_info(fields: &Fields) -> Result<(), Box<dyn std::error::Error>> {
    let Fields {
        user_info,
        os_name,
        kernel_version,
        uptime,
        storage,
    } = fields;

    let system_info = format!(r#"

       |\__/,|   (`\
     _.|o o  |_   ) )     {user_info}
   -(((---(((--------

    System        {os_name}
    Kernel        {kernel_version}
    Uptime        {uptime}
  󱥎  Storage (/)   {storage}
"#);

    Ok(stdout().write_all(system_info.as_bytes())?)
}

