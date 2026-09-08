#[no_mangle]
pub extern "C" fn kellar_init_core() -> i32 {
    println!("[+] Rust FFI initialized for external bindings.");
    0
}
