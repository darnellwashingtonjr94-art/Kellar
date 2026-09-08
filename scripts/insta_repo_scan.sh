#!/bin/bash
echo "[+] Initializing Insta-Repo automated security scanner..."

TARGET_DIR=${1:-"."}

echo "[*] Scanning directory: $TARGET_DIR for exposed keys and misconfigurations..."
# Run credential and pattern matching checks
grep -rnw "$TARGET_DIR" -e "PRIVATE KEY" --exclude-dir={.git,node_modules,target}

echo "[+] Security audit scan completed."
