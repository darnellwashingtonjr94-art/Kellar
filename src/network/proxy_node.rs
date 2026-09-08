use tokio::net::TcpListener;
use tokio::io::{AsyncReadExt, AsyncWriteExt};

pub async fn start_proxy_node(bind_addr: &str) -> Result<(), Box<dyn std::error::Error>> {
    let listener = TcpListener::bind(bind_addr).await?;
    println!("[+] Proxy Node actively listening on {}", bind_addr);

    loop {
        let (mut socket, addr) = listener.accept().await?;
        println!("[*] Accepted connection from: {}", addr);
        
        tokio::spawn(async move {
            let mut buf = [0; 1024];
            if let Ok(n) = socket.read(&mut buf).await {
                if n == 0 { return; }
                // Echo back or route to parallel execution engine
                let _ = socket.write_all(&buf[0..n]).await;
            }
        });
    }
}
