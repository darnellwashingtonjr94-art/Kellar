#!/data/data/com.termux/files/usr/bin/bash
echo "[+] Initializing Termux Environment for Kellar..."

pkg update -y && pkg upgrade -y
pkg install -y git python rust clang make nodejs

pip install --upgrade pip
echo "[+] Environment setup complete."
