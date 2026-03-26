# Quickstart: Auth Security & Navigation

## Setup
1. Ensure Firebase is configured correctly for the project.
2. Run `flutter pub get`.

## Running the feature
- The app will automatically start at the Splash screen.
- If previously logged in, you will be redirected to Home.
- If not logged in, you will be redirected to Login.

## Verification Steps
1. **Successful Login**: Sign in with a valid account -> Verify redirect to `/home`.
2. **Account Deactivation**:
    - Disable user in Firebase Console.
    - Wait for token refresh (or restart app).
    - Verify error dialog appears and user is redirected to `/login`.
3. **Reactive Routing**:
    - Attempt to access `/home` while signed out -> Should redirect to `/login`.
    - Attempt to access `/login` while signed in -> Should redirect to `/home`.
