#!/bin/bash

set -e

SERVICES=(
    "common"
    "gateway-service"
    "config-service"
    "auth-service"
    "tenant-service"
    "ticket-service"
    "notification-service"
    "ai-service"
    "kb-service"
    "chat-service"
    "analytics-service"
    "search-service"
    "observability-service"
)

echo "Building all ACSP services..."

# Build Docker images for each service
for service in "${SERVICES[@]}"; do
    if [ "$service" != "common" ]; then
        echo "Building $service..."
        docker build \
            --build-arg SERVICE_NAME=$service \
            -f deployment/docker/Dockerfile.service-template \
            -t acsp/$service:latest \
            .
    fi
done

# Build frontend
echo "Building frontend..."
docker build \
    -f deployment/docker/Dockerfile.frontend \
    -t acsp/frontend:latest \
    .

echo "All services built successfully!"
