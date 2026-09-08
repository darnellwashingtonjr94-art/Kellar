🛡️ 𝙆𝙀𝙇𝙇𝘼𝙍 𝙀𝘾𝙊𝙎𝙔𝙎𝙏𝙀𝙈 🛡️
​High-Performance Asynchronous AI Network & Dynamic Threat Reasoning Engine

🌐 𝑾𝒉𝒂𝒕 𝒊𝒔 𝒕𝒉𝒊𝒔 𝒂𝒃𝒐𝒖𝒕?
The Kellar Ecosystem is a next-generation cybersecurity engine designed to fuse high-speed local telemetry with dynamic LLM-driven threat reasoning. It links real-time system surveillance, an asynchronous AI router, and an air-gapped malware detonation chamber into a unified, visual dashboard.

⚡ 𝑾𝒉𝒂𝒕 𝒕𝒉𝒊𝒔 𝒅𝒐𝒆𝒔?
👁️ Monitors ➔ Actively tracks system execution, network sockets, and memory addresses at ultra-low latency.

🧠 Analyzes ➔ Evaluates raw telemetry using fast heuristic passes to flag suspicious behavior instantly.

🔀 Routes ➔ Streamlines high-complexity logs directly to Gemini 3.1 Pro for deep contextual threat analysis and remediation blueprints.

☣️ Isolates ➔ Detonates and interrogates unknown payloads inside a secure, containerized environment using YARA engine signatures.

📊 Visualizes ➔ Streams live telemetry, threat metrics, and AI intelligence directly onto a custom React control terminal.

⚙️ 𝑯𝒐𝒘 𝒅𝒐𝒆𝒔 𝒕𝒉𝒊𝒔 𝒘𝒐𝒓𝒌?
  [ System Telemetry ]
           │
           ▼
 ⚡ [ s3lf-c0n8ci0us ] ──(Low-Latency Engine)──► 📊 [ kellar-ui ]
           │                                            ▲
           ▼                                            │
 📞 [ aquarius ] ──► 🤖 [ Gemini 3.1 Pro ] ──────────────┤
           │                                            │
           ▼                                            │
 ☣️ [ malware-sandbox ] ────────────────────────────────┘

 The system coordinates 4 isolated microservices over a shared Docker network:
 
⚡ s3lf-c0n8ci0us (The Fast Brain)
Tech stack: Rust • Tokio
High-velocity surveillance engine serving as the first responder—parsing system events and flagging anomalies.

📞 aquarius (The Telecommunication Layer)
Tech stack: Python • FastAPI • LiteLLM
Connects local services to Gemini 3.1 Pro, prompting the AI for root-cause analysis and actionable mitigation steps.

☣️ malware-sandbox (The Detonation Vault)
Tech stack: Python • YARA • SQLite
Quarantines suspicious payloads, executes automated YARA rules, and safely logs analysis vectors.

📊 kellar-ui (The Control Command)
Tech stack: React • Vite • Tailwind CSS
Renders system telemetry, AI remediation notes, and sandbox diagnostics in real time.

🔥 𝑾𝒉𝒚 𝒊𝒔 𝒕𝒉𝒊𝒔 𝒄𝒐𝒐𝒍?
💡 Cognitive Defense over Rigid Rules
Traditional antivirus systems rely on static signatures. Kellar couples the raw execution speed of Rust with the reasoning depth of LLMs. It doesn't just flag a file—it computes intent, translates complex system calls into plain language, and designs a tailored response on the fly.

🎯 𝑾𝒉𝒂𝒕 𝒑𝒓𝒐𝒃𝒍𝒆𝒎𝒔 𝒕𝒉𝒊𝒔 𝒔𝒐𝒍𝒗𝒆𝒔?
🔕 Alert Fatigue ➔ Replaces overwhelming log dumps with clean, prioritized AI summaries.

👁️‍🗨️ Zero-Day Blindspots ➔ Detects novel threats by analyzing runtime behavior instead of relying purely on known file hashes.

🛡️ Blast Radius Containment ➔ Guarantees zero host leakage by forcing all payload detonation to occur within containerized air gaps.

🚀 𝑯𝒐𝒘 𝒕𝒐 𝒊𝒏𝒔𝒕𝒂𝒍𝒍 𝒕𝒉𝒊𝒔?
1. Configure Environment Secrets
   echo "GEMINI_API_KEY=your_actual_gemini_api_key_here" > .env

2 Build & Spin Up Ecosystem.
docker-compose up --build -d

3. Access Control Dashboard
   http://localhost:5173
   
