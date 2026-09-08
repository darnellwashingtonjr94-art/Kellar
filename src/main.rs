use std::env;

fn main() {
    println!("[+] Kellar High-Performance Execution Engine Started.");
    let args: Vec<String> = env::args().collect();
    println!("[+] Target runtime args: {:?}", args);
}
