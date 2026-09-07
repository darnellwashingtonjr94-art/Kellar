# Build Stage
FROM rust:1.75 as builder
WORKDIR /usr/src/s3lf-c0n8ci0us
COPY Cargo.toml Cargo.lock ./
# Create a dummy src to cache dependencies
RUN mkdir src && echo "fn main() {}" > src/main.rs
RUN cargo build --release
RUN rm -rf src

# Now copy the actual source code and build
COPY src ./src
# Touch main.rs to ensure Cargo recompiles the actual source
RUN touch src/main.rs
RUN cargo build --release

# Runtime Stage
FROM debian:bookworm-slim
WORKDIR /app
# Copy the compiled binary from the builder stage
COPY --from=builder /usr/src/s3lf-c0n8ci0us/target/release/s3lf-c0n8ci0us .

CMD ["./s3lf-c0n8ci0us"]
