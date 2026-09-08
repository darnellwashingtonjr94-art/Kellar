#!/bin/bash
set -e

echo "==> Cleaning up corrupted Dockerfile..."
rm -f Dockerfile

echo "==> Generating clean Dockerfile..."
cat << 'EOF' > Dockerfile
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Install baseline dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Default execution command
CMD ["/bin/bash"]
EOF

echo "==> Verifying repository remote..."
git remote set-url origin https://github.com/credkellar-boop/kellar-ecosystem.git

echo "==> Staging and committing fixes..."
git add Dockerfile
git commit -m "fix(docker): replace invalid shell wrapping with valid Docker instructions"

echo "==> Pushing to remote repository..."
git push origin main
EOF

# 3. Stage, commit, and push the clean updates
git add Dockerfile .github/workflows/docker-publish.yml
git commit -m "fix(infra): update Dockerfile and workflow with correct syntax"
git push origin main
EOF

# 3. Stage, commit, and push the corrections
git add Dockerfile .github/workflows/docker-publish.yml
git commit -m "fix(infra): correct Dockerfile contents and update workflow secrets"
git push origin main
