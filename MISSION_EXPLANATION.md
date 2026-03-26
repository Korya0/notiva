# Mission: Auth Security & Navigation Enhancements

## Problem
The app's authentication system was previously non-reactive and lacked real-time detection for revoked sessions (e.g., when an account is disabled or deleted in the Firebase Console). Additionally, the navigation required manual BLoC-to-UI triggers, which is less robust than a centralized reactive router.

## Architectural Changes

### 1. Reactive Navigation (GoRouter + AuthCubit)
We've moved the navigation logic away from individual BLoC listeners. The `GoRouter` now uses a `refreshListenable` that watches the `AuthCubit` stream. 
- When `AuthCubit` emits `Authenticated`, the router automatically redirects to `/home`.
- When `AuthCubit` emits `Unauthenticated`, the router automatically redirects to `/login`.
- This ensures a single source of truth for routing.

### 2. Session Integrity (idTokenChanges)
Instead of relying on `authStateChanges()`, which only triggers on explicit sign-in/out, we now use `idTokenChanges()`.
- This stream also triggers when the ID token is refreshed (every hour) or when the current token is revoked by Firebase (e.g., account disabled).
- This allows the app to detect and gracefully handle administrative account mutations without polling.

### 3. Local State Persistence (AppStorage)
Essential user metadata (`id`, `name`, `email`) is now persisted locally via `AppStorage`.
- **Purpose**: Faster cold starts (immediate auth state before network check) and offline user context.
- **Security**: Sensitive tokens remain managed by Firebase Auth; only display-tier metadata is persisted in `SharedPreferences`.

## Task Progress

- [x] T001: Add metadata storage keys
- [x] T002: Inject AppStorage into AuthCubit
- [ ] T003: Document new architecture (This file)

## Implementation Notes
- **Principle II (Clean Architecture)**: The `AuthRepository` handles the Firebase-specific stream mapping, keeping the `AuthCubit` agnostic of the underlying implementation details.
- **Principle III (State Management)**: `AuthCubit` remains the orchestrator of authentication state.
- **Principle VII (Testing)**: Unit tests for the updated `AuthCubit` are mandatory before completion.
