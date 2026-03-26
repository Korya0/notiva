# Implementation Plan: Auth Security & Navigation Enhancements

**Branch**: `002-auth-security-navigation` | **Date**: 2026-03-26 | **Spec**: [spec.md](file:///d:/flutter/flutter_Projects/notiva/notiva/002-auth-security-navigation/spec.md)

## Summary
Enhance the authentication layer by implementing reactive routing with GoRouter, upgrading state monitoring to `idTokenChanges()` for account deactivation detection, and persisting user metadata using `AppStorage`.

## Technical Context
**Language/Version**: Dart 3.x / Flutter 3.x  
**Primary Dependencies**: `firebase_auth`, `go_router`, `flutter_bloc`, `shared_preferences`  
**Storage**: `SharedPreferences` (via `AppStorage`)  
**Testing**: `flutter_test` (Unit tests for `AuthCubit`)  
**Target Platform**: Android, iOS, Web  
**Project Type**: Mobile App / Web App  
**Constraints**: Must follow Clean Architecture (Presentation -> Domain -> Data)  

## Constitution Check
- [x] No over-engineering (Using existing storage and standard streams)
- [x] Layer boundaries respected (Repository handles Firebase, Cubit handles state, Guard handles routing)
- [x] Documentation strategy defined (Using this plan and code comments)
- [x] Unit tests plan for `AuthCubit` changes

## Project Structure

### Documentation (this feature)
```text
notiva/002-auth-security-navigation/
├── plan.md              # This file
├── research.md          # Architectural decisions
├── data-model.md        # Entity definitions
└── quickstart.md        # How to run/verify
```

### Source Code Mapping
```text
lib/
├── core/
│   ├── router/
│   │   ├── auth_guard.dart     # Updated redirect logic
│   │   └── app_router.dart     # Added refreshListenable
│   └── storage/
│       └── storage_keys.dart   # Added user info keys
└── features/
    └── auth/
        ├── data/repositories/
        │   └── firebase_auth_repository_impl.dart # idTokenChanges
        └── presentation/cubit/auth/
            └── auth_cubit.dart # persistence & redirect trigger
```

## Complexity Tracking
*No constitution violations detected.*
