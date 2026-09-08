.PHONY: all rust python c node clean

all: rust python c node

rust:
	cargo build --release

python:
	python3 -m pytest tests/

c:
	mkdir -p build && cd build && cmake .. && make

node:
	npm run build
