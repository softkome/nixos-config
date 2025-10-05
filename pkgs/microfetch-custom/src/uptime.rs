use std::{io, mem::MaybeUninit};

pub fn get_current() -> Result<String, io::Error> {
    let uptime_seconds = {
        let mut info = MaybeUninit::uninit();
        if unsafe { libc::sysinfo(info.as_mut_ptr()) } != 0 {
            return Err(io::Error::last_os_error());
        }
        unsafe { info.assume_init().uptime as u64 }
    };

    let days = uptime_seconds / 86400;
    let hours = (uptime_seconds / 3600) % 24;
    let minutes = (uptime_seconds / 60) % 60;

    let mut result = String::with_capacity(32);
    if days > 0 {
        result.push_str(&days.to_string());
        result.push_str(if days == 1 { " day" } else { " days" });
    }
    if hours > 0 {
        if !result.is_empty() {
            result.push_str(", ");
        }
        result.push_str(&hours.to_string());
        result.push_str(if hours == 1 { " hour" } else { " hours" });
    }
    if minutes > 0 {
        if !result.is_empty() {
            result.push_str(", ");
        }
        result.push_str(&minutes.to_string());
        result.push_str(if minutes == 1 { " minute" } else { " minutes" });
    }
    if result.is_empty() {
        result.push_str("less than a minute");
    }

    Ok(result)
}
