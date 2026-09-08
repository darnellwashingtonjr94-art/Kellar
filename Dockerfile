version: '3.8'

services:
  kellar-api:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    environment:
      - KELLAR_ENV=production
    volumes:
      - .:/app
