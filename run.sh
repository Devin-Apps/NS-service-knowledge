#!/bin/bash

# Load environment variables
source .env

# Run the Docker container
docker run -d \
  --name notification-service \
  -p 8080:8080 \
  -e TWILIO_ACCOUNT_SID=${TWILIO_ACCOUNT_SID} \
  -e TWILIO_AUTH_TOKEN=${TWILIO_AUTH_TOKEN} \
  notification-service:latest

echo "Notification Service container started. Access it at http://localhost:8080"
