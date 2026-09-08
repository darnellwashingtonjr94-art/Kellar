# 1. Write the clean, valid Dockerfile
cat << 'EOF' > Dockerfile
FROM ubuntu:latest
WORKDIR /app
COPY . .
CMD ["echo", "Kellar Ecosystem root container built successfully"]
EOF

# 2. Write the clean GitHub Actions workflow file
mkdir -p .github/workflows
cat << 'EOF' > .github/workflows/docker-publish.yml
name: Docker Publish

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
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/kellar-ecosystem:latest
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
