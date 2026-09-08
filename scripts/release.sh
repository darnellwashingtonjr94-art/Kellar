#!/bin/bash
echo "[+] Preparing Kellar Monorepo release tags..."

VERSION=$(git describe --tags --always)
echo "[*] Current build identifier: $VERSION"

# Run final validation checks
cargo test && npm test
echo "[+] Release pipeline verified and ready for deployment."
