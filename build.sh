#!/bin/bash
set -e

# Build the Docker image
docker build -t notification-service:latest .

echo "Docker image built successfully."
