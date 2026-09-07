use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct TelemetryPacket {
    pub process_name: String,
    pub memory_address: String,
    pub action_type: String, // e.g., "NETWORK_CALL", "FILE_WRITE"
}

#[derive(Debug, Serialize, Deserialize)]
pub struct AnalysisResult {
    pub packet: TelemetryPacket,
    pub requires_sandbox: bool,
    pub risk_score: u8,
}

pub fn evaluate_telemetry(packet: TelemetryPacket) -> AnalysisResult {
    let mut risk_score = 0;
    let mut requires_sandbox = false;

    // Simple heuristic example for the fast engine
    if packet.action_type == "SYSTEM_REGISTRY_MOD" {
        risk_score += 50;
    }
    
    if packet.process_name.ends_with(".tmp") && packet.action_type == "NETWORK_CALL" {
        risk_score += 80;
        requires_sandbox = true;
    }

    AnalysisResult {
        packet,
        requires_sandbox,
        risk_score,
    }
}
