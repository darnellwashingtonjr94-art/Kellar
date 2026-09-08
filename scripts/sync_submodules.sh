#!/bin/bash
echo "[+] Updating all submodules to latest main commits..."

git submodule update --init --recursive --remote
git add .
git commit -m "chore: sync all submodules to latest upstream"
echo "[+] Submodules synchronized successfully."
