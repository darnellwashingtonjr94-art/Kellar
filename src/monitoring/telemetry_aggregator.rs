use std::collections::HashMap;

pub struct TelemetryAggregator {
    node_metrics: HashMap<String, f64>,
}

impl TelemetryAggregator {
    pub fn new() -> Self {
        Self {
            node_metrics: HashMap::new(),
        }
    }

    pub fn ingest_metric(&mut self, node_id: &str, cpu_load: f64) {
        self.node_metrics.insert(node_id.to_string(), cpu_load);
        println!("[+] Ingested telemetry for node {}: {}% CPU", node_id, cpu_load);
    }
}
