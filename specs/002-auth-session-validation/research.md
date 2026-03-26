# Research: Auth Session Validation

## Decision: Background `user.reload()` on App Start

**Decision**: We will implement a background call to `FirebaseAuth.instance.currentUser?.reload()` immediately after the `AuthCubit` initializes the initial state.

### Rationale
- **Efficiency**: `user.reload()` is a standard Firebase method that specifically updates the local user profile (including `disabled` status) from the server.
- **Non-Blocking**: By running this after the initial `AuthAuthenticated` state (from local storage), we preserve the "Fast Cold Start" user experience.
- **Reactive**: Once `reload()` completes, any changes (like the user becoming null or disabled) will be picked up by the `authStateChanges()` or `idTokenChanges()` stream, which `AuthCubit` is already listening to.

### Alternatives Considered

| Alternative | Pros | Cons |
|-------------|------|------|
| `user.getIdToken(true)` | Guaranteed fresh token. | Higher network overhead; more complex error handling. |
| Server-side check on every request | 100% accurate. | Significant performance impact; requires modifying all data requests. |
| Periodic background refresh | Handles sessions that expire while the app is open. | Potential battery drain; complex to manage life-cycle. |

## Implementation Patterns

### AuthRepository Implementation
```dart
Future<Either<AuthFailure, void>> validateSession() async {
  try {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.reload();
    }
    return const Right(null);
  } on FirebaseAuthException catch (e) {
    return Left(FirebaseAuthErrorMapper.mapException(e));
  }
}
```

### AuthCubit Logic
```dart
Future<void> _init() async {
  // initial fast login...
  
  // background validation
  unawaited(_authRepository.validateSession());
}
```

## Findings Summary
The current `AuthCubit` already listens to `_authRepository.user`, which maps to `idTokenChanges()`. Calling `user.reload()` triggers a state change in Firebase if the account is invalid, which will automatically flow through our existing BLoC stream.
