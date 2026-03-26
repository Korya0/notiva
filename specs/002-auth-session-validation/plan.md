# Implementation Plan: Auth Session Validation

**Branch**: `002-auth-session-validation` | **Date**: 2026-03-26 | **Spec**: [spec.md](file:///d:/flutter/flutter_Projects/notiva/specs/002-auth-session-validation/spec.md)
**Input**: Feature specification from `/specs/002-auth-session-validation/spec.md`

## Summary

This feature addresses the issue where invalid (disabled or deleted) Firebase users remain logged into the application due to local session caching and fast-start persistence. The solution involves performing a background `user.reload()` validation on app startup. If the account is found to be invalid, the system will trigger an `AuthSessionExpired` state, leading to an automatic logout and redirection to the login screen via the reactive navigation system.

## Technical Context

**Language/Version**: Dart 3.x / Flutter 3.x  
**Primary Dependencies**: `firebase_auth`, `flutter_bloc`, `go_router`, `get_it`, `dartz`  
**Storage**: `AppStorage` (Secure local persistence)  
**Testing**: `flutter_test`, `bloc_test`, `mocktail`  
**Target Platform**: Mobile (Android/iOS)  
**Project Type**: Mobile App  
**Performance Goals**: Validation check completion < 2s on stable connection.  
**Constraints**: Must not block "Fast Cold Start" UI; must handle offline scenarios gracefully.  
**Scale/Scope**: Notiva Authentication Module (Cubit + Repository).

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

### Mandatory Constitution Gates:
- [x] No over-engineering (Simple-YAGNI) - Using built-in `reload()` is the simplest path.
- [x] Layer boundaries respected (Clean Architecture) - Logic resides in Repository/Cubit.
- [x] Documentation strategy defined (Mission Explanation plan) - Using `research.md` and `plan.md`.
- [x] Unit tests plan for Cubits/Use Cases/Repos - `auth_cubit_test.dart` and `auth_repository_test.dart`.
- [x] Reactive Navigation (Router/RefreshStream) - Already integrated with `AuthCubit` stream.
- [x] Atomic Persistence (Storage Serialization) - `AuthCubit` currently serializes storage writes.

## Project Structure

### Documentation (this feature)

```text
specs/002-auth-session-validation/
├── plan.md              # This file
├── research.md          # Phase 0 output
├── data-model.md        # Phase 1 output
├── quickstart.md        # Phase 1 output (N/A for this fix)
├── contracts/           # Phase 1 output (N/A for this fix)
└── tasks.md             # Phase 2 output (/speckit.tasks command)
```

### Source Code (repository root)

```text
lib/
├── features/
│   └── auth/
│       ├── domain/
│       │   └── repositories/
│       │       └── auth_repository.dart       # [MODIFY] Added validateSession()
│       ├── data/
│       │   └── repositories/
│       │       └── firebase_auth_repository_impl.dart # [MODIFY] Implemented reload logic
│       └── presentation/
│           └── cubit/
│               └── auth/
│                   └── auth_cubit.dart        # [MODIFY] Background validation check
```

**Structure Decision**: Following the existing Single Project Clean Architecture layout.

## Complexity Tracking

*No constitution violations identified.*
