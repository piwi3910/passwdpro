# PasswdPro RooCode Rules

This document outlines the coding standards and best practices for the PasswdPro project. These rules are enforced through ESLint configurations and custom plugins to ensure code quality, security, and consistency across the codebase.

## Overview

The PasswdPro project follows a strict set of coding standards to ensure:

1. **Type Safety** - Strong typing with TypeScript to prevent runtime errors
2. **Security** - Secure cryptographic practices and data handling
3. **Consistency** - Uniform coding patterns across the codebase
4. **Maintainability** - Clean, readable, and well-documented code
5. **Performance** - Efficient and optimized code

## TypeScript Rules

### Strict Typing

- No `any` types allowed (`@typescript-eslint/no-explicit-any`)
- Explicit return types required for functions (`@typescript-eslint/explicit-function-return-type`)
- Explicit module boundary types required (`@typescript-eslint/explicit-module-boundary-types`)
- No non-null assertions (`@typescript-eslint/no-non-null-assertion`)
- Strict null checking enabled (`strictNullChecks`)
- No unnecessary type assertions (`@typescript-eslint/no-unnecessary-type-assertion`)

### Type Definitions

- Interfaces preferred over types (`@typescript-eslint/consistent-type-definitions`)
- Consistent array type definitions (`@typescript-eslint/array-type`)
- Interface names must start with 'I' (`@typescript-eslint/naming-convention`)
- Type names must use PascalCase (`@typescript-eslint/naming-convention`)

### Error Handling

- Proper error handling required (`@typescript-eslint/no-floating-promises`)
- No misused promises (`@typescript-eslint/no-misused-promises`)
- Only throw Error objects (`no-throw-literal`)

## React Component Rules

### Functional Components

- Arrow functions required for components (`react/function-component-definition`)
- No class components allowed
- Proper component naming with PascalCase (`react/jsx-pascal-case`)

### Hooks Usage

- Rules of Hooks enforced (`react-hooks/rules-of-hooks`)
- Exhaustive dependencies required (`react-hooks/exhaustive-deps`)
- No inline function creation in renders (`react/jsx-no-bind`)

### Props Typing

- Props must be properly typed with interfaces
- No prop-types usage (TypeScript handles this)
- Required props must be marked as such

### Accessibility

- Alt text required for images (`jsx-a11y/alt-text`)
- Valid ARIA roles required (`jsx-a11y/aria-role`)
- Valid ARIA properties required (`jsx-a11y/aria-props`)
- ARIA state and property values must be valid (`jsx-a11y/aria-unsupported-elements`)
- Elements with ARIA roles must have required props (`jsx-a11y/role-has-required-aria-props`)

## Tamagui-Specific Rules

### Theme Tokens

- Use theme tokens instead of hardcoded values (`tamagui-best-practices/enforce-theme-tokens`)
- No hardcoded colors, spacing, or font sizes
- Use `$` prefixed tokens for all styling properties

### Component Styling

- Consistent component styling required (`tamagui-best-practices/enforce-consistent-styling`)
- Use variants for component variations
- No inline styles allowed

### Layout Components

- Prefer Stack components for layout (`tamagui-best-practices/prefer-stack-for-layout`)
- Use XStack for horizontal layouts
- Use YStack for vertical layouts
- No direct usage of div or View for layout

### Styling System

- No direct styling without Tamagui's styling system (`tamagui-best-practices/prohibit-direct-styling`)
- No usage of other styling libraries (`no-restricted-imports`)
- No CSS-in-JS libraries like styled-components or emotion

## tRPC API Rules

### Input Validation

- All tRPC procedures must validate input with Zod (`trpc-best-practices/enforce-zod-validation`)
- Comprehensive validation schemas required
- No unvalidated inputs allowed

### Error Handling

- Consistent error handling required (`trpc-best-practices/require-consistent-error-handling`)
- Use try-catch blocks in all procedures
- Use createError for standardized error responses

### Procedure Names

- Descriptive procedure names required (`trpc-best-practices/enforce-descriptive-procedure-names`)
- No vague names like 'get', 'set', 'update'
- Names should clearly indicate the action and entity

### Router Organization

- Domain-based router organization required (`trpc-best-practices/require-domain-based-routers`)
- Routers should be organized by domain (e.g., authRouter, userRouter, vaultRouter)
- No generic routers allowed

## Security Rules

### Secrets Management

- No inline secrets allowed (`security-best-practices/prohibit-inline-secrets`)
- Use environment variables or secure vaults for secrets
- No hardcoded API keys, passwords, or tokens

### Data Encryption

- Client-side encryption required for sensitive data (`security-best-practices/enforce-client-side-encryption`)
- Zero-knowledge architecture enforced
- No unencrypted sensitive data transmission

### Input Validation

- Input validation required for all user inputs (`security-best-practices/require-input-validation`)
- Form validation required
- API input validation required

### Cryptographic Practices

- Secure cryptographic practices enforced (`security-best-practices/enforce-secure-crypto`)
- No deprecated or insecure crypto methods
- Proper IV usage required
- Strong key derivation parameters required

## Implementation

These rules are implemented through:

1. **TypeScript Configuration** - Strict compiler options in tsconfig.json
2. **ESLint Configuration** - Comprehensive ESLint rules
3. **Custom ESLint Plugins**:
   - `eslint-plugin-tamagui-best-practices` - Tamagui-specific rules
   - `eslint-plugin-trpc-best-practices` - tRPC-specific rules
   - `eslint-plugin-security-best-practices` - Security-specific rules

## Enforcement

These rules are enforced through:

1. **CI/CD Pipeline** - Linting checks in the CI/CD pipeline
2. **Pre-commit Hooks** - Linting checks before commits
3. **IDE Integration** - ESLint integration in VS Code and other IDEs
4. **Code Reviews** - Manual enforcement during code reviews

## Exceptions

Exceptions to these rules may be granted in specific cases, but must be:

1. **Documented** - Clear documentation of why the exception is needed
2. **Approved** - Approval from the team lead or security officer
3. **Isolated** - Limited to the specific case
4. **Commented** - Clear comments in the code explaining the exception

## Conclusion

Following these RooCode rules ensures that the PasswdPro project maintains high standards of code quality, security, and consistency. These rules are designed to prevent common issues and ensure that the codebase remains maintainable and secure as it grows.