FROM ubuntu:latest

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
