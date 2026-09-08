#!/bin/bash
# Initializes the development environment for all core languages
echo "Initializing Kellar Monorepo Environments..."

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Python
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
# Node (TS/JS)
npm install
