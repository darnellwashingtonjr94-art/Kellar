import sys
import subprocess

def main():
    print("[+] Initializing Kellar Core Orchestrator...")
    # Executing native Rust engine binding or core pipeline
    try:
        result = subprocess.run(["kellar_engine"], capture_output=True, text=True)
        print(f"[+] Engine Output: {result.stdout}")
    except FileNotFoundError:
        print("[!] Native kellar_engine binary not found in PATH.")

if __name__ == "__main__":
    main()
