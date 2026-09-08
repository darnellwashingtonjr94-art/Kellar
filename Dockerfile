#!/bin/bash
set -e

echo "==> Cleaning existing corrupted files..."
rm -f Dockerfile
mkdir -p .github/workflows

echo "==> Generating clean Dockerfile..."
cat << 'EOF' > Dockerfile
FROM ubuntu:latest

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
EOF

echo "==> Generating fixed GitHub Actions workflow..."
cat << 'EOF' > .github/workflows/docker-publish.yml
name: Build and Push
on:
  push:
    branches: [ "main" ]

jobs:
  build-and-push:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Log in to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}

      - name: Build and push Docker image
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: credkellar/kellar-ecosystem:latest
EOF

echo "==> Setting upstream remote..."
git remote set-url origin https://github.com/credkellar-boop/kellar-ecosystem.git

echo "==> Staging and committing fixes..."
git add Dockerfile .github/workflows/docker-publish.yml
git commit -m "fix(ci): repair Dockerfile parsing and configure valid buildx tags"

echo "==> Pushing to remote repository..."
git push origin main
git add Dockerfile .github/workflows/docker-publish.yml
git commit -m "fix(infra): update Dockerfile and workflow with correct syntax"
git push origin main
EOF

# 3. Stage, commit, and push the corrections
git add Dockerfile .github/workflows/docker-publish.yml
git commit -m "fix(infra): correct Dockerfile contents and update workflow secrets"
git push origin main
