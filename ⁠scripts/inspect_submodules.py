import os
import json

SUBMODULE_PATHS = [
    "ai-engines/Mona",
    "enterprise-defense/Cyber10n1",
    "offensive-security/Cyber-Stack",
    "offensive-security/REDTEAM-ENV",
    "training/Cybersecurity-1"
]

def check_status():
    report = {}
    for path in SUBMODULE_PATHS:
        report[path] = "Present" if os.path.exists(path) else "Missing"
    print(json.dumps(report, indent=2))

if __name__ == "__main__":
    check_status()
