# Stage 1: Build Rust
FROM rust:1.75 AS rust-builder
WORKDIR /app
COPY Cargo.toml ./
# (Add source copy and build commands here)

# Stage 2: Python / Final Env
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY --from=rust-builder /app/target/release/kellar_engine /usr/local/bin/
CMD ["python", "main.py"]
