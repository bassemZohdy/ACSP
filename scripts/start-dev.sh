#!/bin/bash

set -e

echo "Starting ACSP development environment..."

# Start infrastructure services if not running
if ! docker-compose ps | grep -q "config-server.*running"; then
    echo "Starting infrastructure services..."
    docker-compose up -d postgres redis elasticsearch eureka config-server
    echo "Waiting for infrastructure services to be ready..."
    sleep 10
fi

# Start core services
echo "Starting core services..."
docker-compose up -d auth-service tenant-service ticket-service notification-service

# Start AI and search services
echo "Starting AI and search services..."
docker-compose up -d ai-service kb-service chat-service search-service

# Start analytics and observability
echo "Starting analytics and observability services..."
docker-compose up -d analytics-service observability-service

# Start frontend development server
echo "Starting frontend development server..."
cd frontend
npm start

echo "Development environment is ready!"
echo "- Frontend: http://localhost:4200"
echo "- API Gateway: http://localhost:8080"
echo "- Eureka Dashboard: http://localhost:8761"
echo "- Config Server: http://localhost:8888"
