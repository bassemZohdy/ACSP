# Abstract Customizable Customer Support Portal (ACSP)

## Table of Contents
- [Overview](#overview)
- [Key Features](#key-features)
  - [Multi-Tenancy](#multi-tenancy)
  - [Flexible Ticketing](#flexible-ticketing)
  - [Role-Based Access Control](#role-based-access-control)
  - [AI-Powered Support](#ai-powered-support)
  - [Observability](#observability)
  - [Autoscaling](#autoscaling)
- [Quick Start](#quick-start)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Configuration](#configuration)
- [Architecture Overview](#architecture-overview)
  - [Microservices](#microservices)
  - [Frontend](#frontend)
  - [Infrastructure](#infrastructure)
- [Development](#development)
  - [Prerequisites](#prerequisites-1)
  - [Quick Start](#quick-start-1)
- [Deployment](#deployment)
  - [Local Development](#local-development)
  - [Production](#production)
- [Documentation](#documentation)
  - [Architecture Details](/docs/architecture/)
  - [Feature Documentation](/docs/features/)
  - [Operations Guide](/docs/operations/)
  - [API Documentation](/docs/api/)
- [Contributing](#contributing)
- [License](#license)

## Overview
The Abstract Customizable Customer Support Portal (ACSP) is a multi-tenant, scalable, and customizable solution for managing customer support services. The portal is designed to be enterprise-grade, cloud-agnostic, and configurable for diverse industries.

## Key Features

### Multi-Tenancy
- **Tenant Isolation**:
  - Data and configurations are isolated per tenant
  - Support for schema-based multi-tenancy in PostgreSQL or separate databases per tenant

- **Tenant-Specific Customizations**:
  - Branding: Configurable logos, themes, and colors
  - Subdomains: E.g., `support.companyA.com` for Company A

### AI-Powered Support
- Intelligent chatbot with LLM integration
- Knowledge base with semantic search
- Smart ticket routing and classification
- Multi-provider LLM support (Cloud & Self-hosted)

## Quick Start

### Prerequisites
- Java 21 or higher
- Node.js 18.x or higher
- Docker and Docker Compose
- Kubernetes cluster (for production)

### Installation
```bash
# Clone the repository
git clone https://github.com/yourusername/ACSP.git
cd ACSP

# Install backend dependencies and build
cd services
mvn clean install

# Install frontend dependencies and build
cd ../frontend
npm install
npm run build
```

### Current Versions
#### Backend (Java) Dependencies:
- Spring Boot: 3.2.1 (Latest stable)
- Spring Cloud: 2023.0.0 (Latest stable)
- Spring AI: 1.0.0-M5 (Latest milestone)
- OpenAPI: 2.3.0 (Latest stable)
- JJWT: 0.12.3 (Latest stable)
- MapStruct: 1.5.5.Final (Latest stable)
- Lombok: 1.18.30 (Latest stable)

#### Frontend (Angular) Dependencies:
- Angular: 17.0.8 (Latest stable)
- Angular Material: 17.0.4 (Latest stable)
- RxJS: 7.8.1 (Latest stable)
- TypeScript: 5.2.2 (Latest stable)
- Zone.js: 0.14.3 (Latest stable)

## Architecture Overview
ACSP follows a microservices architecture with the following components:

### Microservices
1. **Gateway Service**
   - API Gateway using Spring Cloud Gateway
   - Route management and load balancing
   - Security and authentication

2. **Config Service**
   - Centralized configuration management
   - Environment-specific configurations
   - Runtime configuration updates

3. **Auth Service**
   - Authentication and authorization
   - User management
   - Role-based access control

4. **Tenant Service**
   - Multi-tenant management
   - Tenant configuration
   - Tenant isolation

5. **AI Service**
   - LLM integration
   - AI model management
   - Inference optimization

6. **Knowledge Base Service**
   - Document management
   - Semantic search
   - Version control

7. **Chat Service**
   - Real-time chat functionality
   - Chat history management
   - Bot integration

8. **Search Service**
   - Full-text search
   - Faceted search
   - Search analytics

9. **Analytics Service**
   - Business metrics
   - Usage analytics
   - Performance monitoring

10. **Notification Service**
    - Email notifications
    - Push notifications
    - Notification templates

### Frontend
- Angular 17-based SPA
- Material Design components
- Responsive layout
- Real-time updates

### Infrastructure
- Kubernetes-ready
- Cloud-agnostic design
- Containerized services
- Service mesh support

## Development

### Local Development Setup
1. Start the Config Service first
2. Start the Eureka Service
3. Start other services in any order
4. Start the frontend development server:
   ```bash
   cd frontend
   npm start
   ```

### Building for Production
1. Backend:
   ```bash
   cd services
   mvn clean install -DskipTests
   ```

2. Frontend:
   ```bash
   cd frontend
   npm run build --prod
   ```

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

📚 **Detailed Documentation**: Find comprehensive documentation in the [`/docs`](/docs/) directory.
