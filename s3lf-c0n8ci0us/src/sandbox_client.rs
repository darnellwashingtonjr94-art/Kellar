use reqwest::Client;
use serde_json::json;
use crate::lib::TelemetryPacket;

pub struct SandboxClient {
    http_client: Client,
    sandbox_url: String,
}

impl SandboxClient {
    pub fn new(url: &str) -> Self {
        SandboxClient {
            http_client: Client::new(),
            sandbox_url: url.to_string(),
        }
    }

    /// Sends a suspicious packet to the Malware Sandbox for detonation/YARA scanning
    pub async fn detonate(&self, packet: &TelemetryPacket) -> Result<String, reqwest::Error> {
        let payload = json!({
            "process_name": packet.process_name,
            "memory_address": packet.memory_address,
            "action": packet.action_type
        });

        let res = self.http_client.post(&self.sandbox_url)
            .json(&payload)
            .send()
            .await?;
            
        res.text().await
    }
}
