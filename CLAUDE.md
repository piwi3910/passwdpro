# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

PasswdPro is a secure password manager with a zero-knowledge architecture where all encryption and decryption happens client-side. The project is structured as a monorepo with multiple submodules:

- **passwdpro-server**: Backend server with tRPC API, Fastify, and PostgreSQL
- **passwdpro-web**: Web client with React, Tamagui, and tRPC
- **passwdpro-mobile**: Mobile app (React Native)
- **passwdpro-desktop**: Desktop app
- **passwdpro-shared**: Shared types, utilities, and crypto implementation

## Development Commands

### Server (passwdpro-server)

```bash
# Install dependencies
cd passwdpro-server
npm install

# Generate Prisma client
npm run prisma:generate

# Run database migrations
npm run prisma:migrate

# Seed the database
npm run prisma:seed

# Start development server
npm run dev

# Build for production
npm run build

# Run linting
npm run lint

# Run tests
npm run test

# Run Prisma Studio (database GUI)
npm run prisma:studio

# Format code
npm run format
```

### Web Client (passwdpro-web)

```bash
# Install dependencies
cd passwdpro-web
npm install

# Start development server
npm run dev

# Build for production
npm run build

# Run linting
npm run lint

# Preview production build
npm run preview
```

### Shared Package (passwdpro-shared)

```bash
# Install dependencies
cd passwdpro-shared
npm install

# Build package
npm run build

# Run linting
npm run lint

# Run tests
npm run test

# Format code
npm run format

# Prepare for npm integration (builds package)
npm run prepare
```

### Mobile Client (passwdpro-mobile)

```bash
# Install dependencies
cd passwdpro-mobile
npm install

# Start development server
npm start

# Run iOS simulator
npm run ios

# Run Android simulator
npm run android
```

## Submodule Management

The project uses Git submodules for each component. When making changes across multiple submodules:

```bash
# Update all submodules to latest
git submodule update --remote

# Commit changes in a submodule
cd <submodule-dir>
git add .
git commit -m "Your commit message"
git push

# Update main repository to reference new submodule commit
cd ..
git add <submodule-dir>
git commit -m "Update <submodule> reference"
git push
```

## Architecture Overview

### Zero-Knowledge Architecture

- All encryption/decryption happens client-side
- Server never receives plaintext data or encryption keys
- Only encrypted data is stored on the server
- Master password never sent to the server
- Multiple keys derived for different purposes (encryption, authentication)

### Backend Architecture

- **Fastify**: Web framework
- **tRPC**: End-to-end type-safe API
- **Prisma**: Type-safe ORM for PostgreSQL
- **Authentication**: JWT tokens and Argon2id for password hashing
- **API Structure**: Domain-based routers (auth, vault, vaultItem, sync)

### Frontend Architecture

- **React**: UI library
- **Tamagui**: UI component library with theming
- **tRPC Client**: Type-safe API client
- **React Router**: Client-side routing
- **React Query**: Data fetching and state management

### Data Models

- **User**: User account information
- **Vault**: Container for vault items
- **VaultItem**: Individual encrypted items (passwords, notes, etc.)
- **SyncRecord**: Tracks changes for differential sync
- **AuditLog**: Security audit logging

## Coding Standards

### TypeScript Rules

- Strict typing with no `any` types
- Explicit return types required for functions
- Interfaces preferred over types
- Proper error handling required
- No non-null assertions
- Interface names must start with 'I'
- Type names must use PascalCase

### React Component Rules

- Only functional components with hooks
- Props must be typed with interfaces
- Exhaustive dependencies in hooks
- Accessibility requirements enforced
- No inline function creation in renders

### Tamagui Rules

- Use theme tokens instead of hardcoded values
- Consistent component styling with variants
- Stack components for layout (XStack, YStack)
- No direct styling without Tamagui's styling system
- No usage of other styling libraries

### tRPC API Rules

- All inputs validated with Zod
- Consistent error handling with try-catch
- Descriptive procedure names
- Domain-based router organization
- No unvalidated inputs allowed

### Security Rules

- No inline secrets (use environment variables)
- Client-side encryption for sensitive data
- Input validation for all user inputs
- Secure cryptographic practices
- No deprecated or insecure crypto methods
- Proper IV usage required
- Strong key derivation parameters required

## Important Implementation Details

### Cryptography Implementation

The cryptography implementation in `passwdpro-shared/src/crypto/index.ts` provides:

- Key derivation using PBKDF2 with high iteration counts
- AES-GCM for symmetric encryption
- Multiple key derivation for different purposes
- Secure random generation for IVs and salts
- Base64 encoding/decoding utilities

### Synchronization Mechanism

PasswdPro implements a differential sync mechanism that:

- Transmits only changed data
- Provides conflict detection and resolution
- Uses versioning for optimistic concurrency control
- Supports offline operation with sync queue
- Automatically syncs when connection is restored

## Local Development Environment

### Database Setup

The project uses PostgreSQL for data storage and Redis for caching. Docker Compose is provided for easy setup:

```bash
# Start the database and Redis containers
cd passwdpro-server/docker
docker-compose up -d

# Stop the containers
docker-compose down
```

The Docker setup includes:
- PostgreSQL database with initial schema
- Redis for caching and session management
- Isolated network for secure communication

## Testing Strategies

### Server Testing

The server uses Jest for testing:

```bash
# Run all tests
cd passwdpro-server
npm run test

# Run a specific test file
npx jest path/to/test-file.test.ts

# Run tests with coverage
npx jest --coverage
```

### Client Testing

For web client testing:

```bash
# Run tests (when implemented)
cd passwdpro-web
npm run test
```

## Code Generation and Tools

### tRPC Router Generation

The tRPC API provides type-safe communication between client and server. The client types are automatically generated based on the server router definitions.

### Prisma Schema Management

Prisma schema is defined in `passwdpro-server/prisma/schema.prisma`. After schema changes:

1. Create a migration: `npm run prisma:migrate`
2. Generate client: `npm run prisma:generate`
3. Update seed data if needed: Edit `prisma/seed.ts`

## Common Workflows

### Adding a New API Endpoint

1. Define the input validation schema with Zod in the appropriate router
2. Create the tRPC procedure in the router file
3. Implement the business logic
4. Add error handling with try-catch
5. Update the client to use the new endpoint

### Creating a New Component

1. Create a new component file in the appropriate directory
2. Define a props interface with proper typing
3. Implement the component using Tamagui
4. Use theme tokens for styling
5. Export the component through an index.ts file

### Implementing a New Vault Item Type

1. Update the shared types in passwdpro-shared
2. Add encryption/decryption support in the crypto module
3. Update the database schema if necessary
4. Implement UI components for the new item type
5. Add validation for the new item type