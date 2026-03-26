# Research: Auth Security & Navigation Enhancements

## Decisions & Rationale

### 1. Account Deactivation Detection
- **Decision**: Use `FirebaseAuth.instance.idTokenChanges()` instead of `authStateChanges()`.
- **Rationale**: `authStateChanges()` only triggers on sign-in, sign-out, or user change. It does NOT trigger when a user's account is disabled or deleted in the Firebase console while the app is running. `idTokenChanges()` triggers when an ID token is refreshed (every hour), or when it's revoked/invalidated. This allows the app to detect deactivation eventually without aggressive polling.
- **Alternatives considered**: 
    - **Cloud Functions**: Sending a push notification on deactivation. Rejected as over-engineered for this stage.
    - **Polling**: Manually calling `user.reload()` every few minutes. Rejected due to battery/bandwidth concerns.

### 2. Reactive Navigation
- **Decision**: Implement a `GoRouterRefreshStream` that listens to `AuthCubit.stream`.
- **Rationale**: This is the standard pattern for `go_router` to handle auth-based redirection. It keeps the router configuration clean and ensures that any change in `AuthCubit` state (e.g., transition to `AuthUnauthenticated`) immediately triggers the `redirect` logic.
- **Alternatives considered**:
    - **BlocListener in UI**: Navigating manually using `context.go()`. Rejected as it spreads navigation logic across multiple views and is less robust against deep-link edge cases.

### 3. User Metadata Persistence
- **Decision**: Use the existing `AppStorage` abstraction (via `SharedPreferencesStorage`).
- **Rationale**: Simple, efficient, and already implemented. It's perfectly suited for storing non-sensitive strings like `userId`, `userEmail`, and `userName`.
- **Alternatives considered**:
    - **Hive**: More powerful but requires more boilerplate (Adapters, type IDs). Rejected for this simple use case (YAGNI).
    - **Flutter Secure Storage**: Better for tokens, but overkill for non-sensitive display names/emails.

## Dependencies & Patterns
- **Pattern E1/E2**: GoRouter with Auth Guard.
- **Pattern B7**: Global Cubit for state management.
- **Firebase Auth**: `idTokenChanges()` stream.
