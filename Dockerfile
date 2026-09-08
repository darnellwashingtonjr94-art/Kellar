# 1. Create a root Dockerfile template for your services
cat << 'EOF' > Dockerfile
# Multi-stage Dockerfile template for Kellar ecosystem
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
CMD ["npm", "run", "preview"]
EOF

# 2. Create a template .env file for local Docker Compose development
cat << 'EOF' > .env
# Environment variables for Kellar ecosystem
NODE_ENV=development
PORT=3000
EOF

# 3. Create a GitHub Actions workflow for building and publishing Docker images
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
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Build and push Docker image
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: ${{ secrets.DOCKER_USERNAME }}/kellar-ecosystem:latest
EOF

# 4. Stage, commit, and push all new infrastructure files
git add Dockerfile .env .github/workflows/docker-publish.yml
git commit -m "chore(infra): add missing Dockerfile, environment template, and deployment workflow"
git push origin main
