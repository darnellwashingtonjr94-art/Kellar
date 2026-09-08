#!/bin/bash
echo "[+] Running dependency vulnerability audit across languages..."

# Python audit
pip install safety &> /dev/null
safety check

# Rust audit
cargo audit

echo "[+] Vulnerability scan complete."
