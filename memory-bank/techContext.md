# Technical Context: Secure Password Manager

## Technologies Used

### Core Technologies

1. **Programming Languages**
   - **TypeScript/JavaScript**: Primary language for backend services
   - **Dart**: For Flutter mobile applications
   - **Kotlin**: For native Android components
   - **Swift**: For native iOS components
   - **JavaScript/TypeScript**: For planned web interface and browser extensions

2. **Frameworks & Libraries**
   - **Flutter**: For mobile applications (iOS, Android)
   - **Fastify**: For backend API services
   - **Prisma**: For database ORM
   - **Riverpod**: For state management in Flutter
   - **Isar**: For local database storage in Flutter
   - **Electron**: Planned for desktop applications (Windows, macOS, Linux)
   - **React**: Planned for web interface
   - **Go Router**: For navigation in Flutter

3. **Cryptography**
   - **libsodium**: Cryptographic library for core operations
   - **Cryptography package**: For Dart cryptographic operations
   - **PBKDF2**: For key derivation from master password
   - **AES-256-GCM**: For symmetric encryption
   - **XChaCha20-Poly1305**: Alternative encryption algorithm
   - **Argon2id**: For password hashing
   - **RSA**: For asymmetric encryption (sharing features)
   - **HMAC**: For data integrity verification
   - **PointyCastle**: Additional cryptographic operations in Dart

4. **Backend & Infrastructure**
   - **Node.js**: For backend services
   - **PostgreSQL**: For metadata and account information
   - **Redis**: For caching and rate limiting
   - **Docker**: For containerization
   - **Kubernetes**: For orchestration
   - **Prometheus**: For monitoring
   - **Loki**: For log aggregation
   - **ArgoCD**: For GitOps deployment
   - **Cert-Manager**: For TLS certificate management

5. **Testing & Quality Assurance**
   - **Jest**: For backend unit and integration testing
   - **Flutter Test**: For Flutter unit and widget testing
   - **Mockito/Mocktail**: For mocking in tests
   - **ESLint/TSLint**: For code quality
   - **Prettier**: For code formatting
   - **GitHub Actions**: For CI/CD
   - **CodeQL**: For security scanning
   - **Dependabot**: For dependency management

### Development Tools

1. **Version Control**
   - **Git**: For source code management
   - **GitHub**: For repository hosting and collaboration
   - **GitHub Actions**: For CI/CD workflows
   - **Conventional Commits**: For standardized commit messages

2. **CI/CD**
   - **GitHub Actions**: For continuous integration and deployment
   - **CodeQL**: For security scanning
   - **Dependabot**: For dependency management
   - **ArgoCD**: For Kubernetes deployments
   - **Docker Hub**: For container registry

3. **Project Management**
   - **Jira**: For issue tracking and project management
   - **Confluence**: For documentation
   - **Figma**: For UI/UX design
   - **Memory Bank**: For project context and documentation

## Development Setup

### Local Development Environment

1. **Required Software**
   - Node.js (v18+)
   - Flutter (latest stable)
   - Docker Desktop
   - Kubernetes (local with minikube or Docker Desktop)
   - VS Code or Android Studio/IntelliJ IDEA
   - PostgreSQL (local or containerized)
   - Redis (local or containerized)
   - Git

2. **Repository Structure**
   ```
   /
   ├── app/                # Flutter mobile application
   │   ├── lib/            # Dart source code
   │   │   ├── models/     # Data models
   │   │   ├── screens/    # UI screens
   │   │   ├── services/   # Business logic services
   │   │   ├── widgets/    # Reusable UI components
   │   │   └── main.dart   # Application entry point
   │   ├── test/           # Unit and widget tests
   │   └── integration_test/ # Integration tests
   ├── server/             # Backend services
   │   ├── src/            # TypeScript source code
   │   │   ├── plugins/    # Fastify plugins
   │   │   ├── routes/     # API routes
   │   │   ├── schemas/    # API schemas
   │   │   └── prisma/     # Database schema and migrations
   │   └── test/           # Server tests
   ├── kubernetes/         # Kubernetes deployment configuration
   │   ├── backend/        # Backend service deployment
   │   ├── database/       # Database deployment
   │   ├── frontend/       # Frontend deployment
   │   ├── ingress/        # Ingress configuration
   │   ├── cert-manager/   # TLS certificate management
   │   ├── argocd/         # ArgoCD configuration
   │   └── monitoring/     # Monitoring and logging
   ├── scripts/            # Utility scripts
   ├── memory-bank/        # Project documentation
   ├── docs/               # User and developer documentation
   │   ├── deployment/     # Deployment documentation
   │   ├── dev/            # Developer documentation
   │   ├── security/       # Security documentation
   │   └── user/           # User documentation
   └── docker-compose.yml  # Local development environment
   ```

3. **Setup Commands**
   ```bash
   # Server setup
   cd server
   npm install
   npm run prisma:generate
   npm run dev
   
   # Flutter app setup
   cd app
   flutter pub get
   flutter run
   
   # Run tests
   cd server && npm test
   cd app && flutter test
   
   # Local environment with Docker Compose
   docker-compose up -d
   
   # Build and deploy
   cd scripts
   ./deploy.sh
   ```

### Development Workflow

1. **Feature Development**
   - Branch from `main` for each feature
   - Follow TDD approach where applicable
   - Submit PR with required tests
   - Code review by at least one team member
   - Automated CI checks must pass
   - Conventional commit messages

2. **Release Process**
   - Semantic versioning (MAJOR.MINOR.PATCH)
   - Release candidates for testing
   - Automated deployment to staging
   - Manual approval for production
   - Automated rollback capability

3. **Security Practices**
   - Regular dependency audits
   - Static code analysis in CI pipeline
   - Regular penetration testing
   - Bug bounty program
   - Security-focused code reviews

4. **Documentation**
   - API documentation with Swagger
   - Architecture documentation with Mermaid
   - User documentation with Markdown
   - Memory bank for project context
   - Security whitepapers

## Technical Constraints

1. **Security Requirements**
   - FIPS 140-2 compliance for cryptographic modules
   - SOC 2 compliance for service operations
   - Regular third-party security audits
   - No unencrypted data transmission
   - Zero-knowledge architecture

2. **Performance Targets**
   - Sub-second vault decryption
   - Minimal memory footprint
   - Efficient battery usage on mobile
   - Fast sync operations even with large vaults
   - Responsive UI under all conditions

3. **Compatibility Requirements**
   - iOS 14+, Android 9+
   - Chrome, Firefox, Safari, Edge (latest 2 versions)
   - Windows 10+, macOS 10.15+, Ubuntu 20.04+ (planned)
   - Offline functionality across all platforms
   - Accessibility compliance

4. **Regulatory Compliance**
   - GDPR compliance for EU users
   - CCPA compliance for California users
   - HIPAA compatibility for healthcare use cases
   - Export compliance for cryptography
   - Data residency options for regulated industries

## Dependencies

### External Services

1. **Have I Been Pwned API**
   - For breach detection
   - K-anonymity implementation for secure checking
   - Rate-limited API access
   - Cached results for performance

2. **Cloud Storage Providers**
   - Optional integration for backup
   - OAuth authentication
   - End-to-end encryption for all stored data
   - Support for major providers (Google Drive, Dropbox, OneDrive)

3. **Push Notification Services**
   - Firebase Cloud Messaging (Android)
   - Apple Push Notification Service (iOS)
   - Web Push API (browsers)
   - Encrypted notification payload

### Third-Party Libraries

1. **Critical Security Dependencies**
   - Flutter Sodium (libsodium wrapper for Flutter)
   - Cryptography package for Dart
   - Argon2 for password hashing
   - PointyCastle for additional cryptographic operations
   - Flutter Secure Storage for sensitive data

2. **UI Dependencies**
   - Flutter Material Design
   - Flutter Hooks
   - Flutter Riverpod
   - Flutter Animate
   - Google Fonts
   - Responsive Framework

3. **Storage Dependencies**
   - Isar for local database
   - Flutter Secure Storage for sensitive data
   - Shared Preferences for settings
   - SQLite (via Isar)
   - Hive for lightweight storage

4. **Networking Dependencies**
   - Dio for HTTP requests
   - Connectivity Plus for network status
   - JWT Decoder for token handling
   - Retry for resilient network operations
   - HTTP Override for testing

## Tool Usage Patterns

1. **Monorepo Management**
   - Separate repositories for server and client applications
   - Shared documentation in memory-bank
   - Coordinated versioning
   - Cross-repository CI/CD integration

2. **Testing Strategy**
   - Unit tests for core logic
   - Widget tests for UI components
   - Integration tests for critical user flows
   - Security-focused testing for crypto operations
   - Performance testing for large vaults

3. **Documentation**
   - API documentation with Swagger
   - Architecture documentation with Mermaid diagrams
   - User documentation with Markdown
   - Security white papers for transparency
   - Memory bank for project context

4. **Monitoring & Analytics**
   - Error tracking with Sentry
   - Performance monitoring with Prometheus
   - Usage analytics (opt-in only)
   - Sync failure detection and alerting
   - Security event monitoring

5. **Deployment Strategy**
   - Containerized applications with Docker
   - Kubernetes orchestration
   - GitOps with ArgoCD
   - Blue/green deployments for zero downtime
   - Canary releases for risk mitigation

## Environment Configuration

1. **Development Environment**
   - Local Docker Compose setup
   - Development-specific environment variables
   - Mock services for external dependencies
   - Hot reload for rapid iteration
   - Local Kubernetes cluster (optional)

2. **Staging Environment**
   - Kubernetes-based deployment
   - Replica of production configuration
   - Test data generation
   - Performance testing
   - Security scanning

3. **Production Environment**
   - High-availability Kubernetes cluster
   - Database replication and backups
   - Comprehensive monitoring
   - Auto-scaling configuration
   - Geographic distribution (future)

4. **CI/CD Pipeline**
   - Automated testing on PR
   - Security scanning
   - Dependency auditing
   - Automated deployment to staging
   - Manual promotion to production

This technical context provides a comprehensive overview of the technologies, tools, and practices used in the development of our secure password manager, ensuring consistency and clarity for all team members.