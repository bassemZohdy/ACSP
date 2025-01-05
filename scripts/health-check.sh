#!/bin/bash

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Function to check health endpoint
check_health() {
    local service=$1
    local url=$2
    echo -n "Checking $service... "
    if curl -f -s "$url" > /dev/null; then
        echo -e "${GREEN}OK${NC}"
        return 0
    else
        echo -e "${RED}FAIL${NC}"
        return 1
    fi
}

# Infrastructure Services
echo "Checking Infrastructure Services..."
check_health "PostgreSQL" "http://localhost:5432" || true
check_health "Redis" "http://localhost:6379" || true
check_health "Elasticsearch" "http://localhost:9200" || true

# Core Services
echo -e "\nChecking Core Services..."
check_health "Eureka Server" "http://localhost:8761/actuator/health" || true
check_health "Config Server" "http://localhost:8888/actuator/health" || true
check_health "Gateway" "http://localhost:8080/actuator/health" || true
check_health "Auth Service" "http://localhost:8081/actuator/health" || true
check_health "Tenant Service" "http://localhost:8082/actuator/health" || true
check_health "Ticket Service" "http://localhost:8083/actuator/health" || true

# Support Services
echo -e "\nChecking Support Services..."
check_health "Notification Service" "http://localhost:8084/actuator/health" || true
check_health "AI Service" "http://localhost:8085/actuator/health" || true
check_health "KB Service" "http://localhost:8086/actuator/health" || true
check_health "Chat Service" "http://localhost:8087/actuator/health" || true
check_health "Search Service" "http://localhost:8088/actuator/health" || true
check_health "Analytics Service" "http://localhost:8089/actuator/health" || true
check_health "Observability Service" "http://localhost:8090/actuator/health" || true

# Frontend
echo -e "\nChecking Frontend..."
check_health "Frontend" "http://localhost:4200" || true
