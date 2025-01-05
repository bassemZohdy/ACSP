#!/bin/bash

set -e

echo "Setting up ACSP development environment..."

# Check prerequisites
echo "Checking prerequisites..."
command -v java >/dev/null 2>&1 || { echo "Java is required but not installed. Aborting." >&2; exit 1; }
command -v node >/dev/null 2>&1 || { echo "Node.js is required but not installed. Aborting." >&2; exit 1; }
command -v docker >/dev/null 2>&1 || { echo "Docker is required but not installed. Aborting." >&2; exit 1; }

# Setup services
echo "Building microservices..."
cd services
./mvnw clean install -DskipTests

# Setup frontend
echo "Setting up frontend..."
cd ../frontend
npm install

# Copy configuration templates
echo "Setting up configuration..."
cd ..
cp config/templates/.env.example .env

# Start infrastructure services
echo "Starting infrastructure services..."
docker-compose up -d postgres redis elasticsearch eureka config-server

echo "Setup complete! Run './scripts/start-dev.sh' to start the development environment."
