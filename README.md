# Kellar Ecosystem

Kellar is a high-performance, asynchronous defense network and reasoning engine. It fuses parallel Rust-based computation, LLM-powered dynamic routing, and an isolated threat sandbox into a single cohesive UI.

## Architecture

1. **S3lf-c0n8ci0us (The Fast Brain):** A Rust/Tokio core built for high-velocity, parallel telemetry parsing. 
2. **A-Q-U-A-R-I-U-S (The Telephone):** A Python/FastAPI and LiteLLM router connecting the system to Gemini 3.1 Pro for complex decision-making.
3. **Malware Sandbox Suite (The Locked Room):** An isolated Docker container utilizing YARA and SQLite for safe execution and analysis of hostile code.
4. **Kellar UI:** A React/Vite interface for real-time visualization of threats and system operations.

## Quick Start

```bash
docker-compose up --build
