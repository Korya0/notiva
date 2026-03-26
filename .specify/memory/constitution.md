<!--
Sync Impact Report:
- Version change: 1.1.0 → 1.2.0
- List of modified principles:
    - Principle III: Added guidance on Reactive Navigation using GoRouterRefreshStream.
    - Principle V: Added guidance on Atomic Persistence and serializing storage writes.
- Added sections: N/A
- Removed sections: N/A
- Templates requiring updates (✅ updated / ⚠ pending):
    - .specify/templates/plan-template.md (✅ updated)
    - .specify/templates/spec-template.md (✅ updated)
- Follow-up TODOs: N/A
-->

# Notiva Constitution

## Core Principles

### Principle I: Senior Identity & Simple-YAGNI
Avoid over-engineering. Apply design patterns only if they provide real, immediate value. Code must be "Senior-Level Simple"—if it requires complex explanation, it must be refactored. Follow the "No Basmaga" philosophy where tools serve the product, not vice versa.

### Principle II: Layered Clean Architecture
Strict adherence to the layer boundary: `Presentation (UI/Bloc) -> Domain (Use Cases/Entities/Repo Interfaces) -> Data (Repos/DTOs/API)`. Business logic is forbidden in the UI. Domain entities must be independent of API models (DTOs). Direct repository access from the UI is prohibited.

### Principle III: State Management, DI & Reactive Navigation
Use Cubit as the default state management for UI logic with **Sealed Classes** for states (no Freezed). Constructor injection is mandatory using **GetIt**. **Implement 🔄 Reactive Navigation** by linking `GoRouter` with auth/state streams via `GoRouterRefreshStream` to centralize redirection logic and eliminate manual navigation calls in UI listeners.

### Principle IV: Performance & Modern Dart
Utilize `Isolate.run()` for heavy computation (JSON > 50KB, image processing). `const` constructors are mandatory wherever possible. Leverage modern Dart features: Records, Patterns, Sealed Classes, and dot shorthands. Avoid `Opacity` in animations; use `FadeTransition` or `AnimatedOpacity`.

### Principle V: Lean Dependencies, Security & Atomic Persistence
Prioritize built-in components. Every new dependency requires Tech Lead approval. No hardcoded secrets; use `--dart-define-from-file`. Securely store tokens using `flutter_secure_storage`. **Ensure Atomicity** in local storage by serializing concurrent writes (e.g., using a `Future` queue in Cubit listeners) to prevent race conditions during rapid state transitions.

### Principle VI: Documentation & Traceability (NON-NEGOTIABLE)
All code MUST be documented. Naming should be self-documenting (classes `PascalCase`, variables `camelCase`). Use `MISSION_EXPLANATION.md` for major tasks to track rationale and implementation steps. "Doc as you go" is the standard.

### Principle VII: Mandatory Testing
Unit tests are mandatory for Cubits, Use Cases, and Repositories. Widget tests are required for shared UI components. All error paths must be handled and tested (e.g., using `ApiResult`).

## Security & Quality Standards

- **Formatting**: Line length max 80 characters. Classes in `PascalCase`, variables in `camelCase`, files in `snake_case`.
- **Privacy**: No PII (Personally Identifiable Information) or tokens in logs.
- **Modernity**: Remove SkSL warmup; use Impeller.

## Development Workflow

- **Branching**: All work happens on short-lived `feature/`, `bugfix/`, or `refactor/` branches created from `develop`. `main` remains the stable production branch.
- **Commits**: Use Conventional Commits (e.g., `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`).
- **Review**: All merges to `develop` require peer review and verification of constitution compliance.

## Governance

This constitution supersedes all other experimental practices. Amendments require formal documentation, version increment, and a migration plan for existing code if necessary. All PRs and reviews must verify compliance with these principles.

**Version**: 1.2.0 | **Ratified**: 2026-03-25 | **Last Amended**: 2026-03-26
