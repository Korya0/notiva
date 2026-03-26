# Data Model: Auth Security & Navigation Enhancements

## Entities

### AuthUser (Domain Entity)
Represents the user across the system.
- `id` (String, required): Unique identifier from Firebase.
- `email` (String, required): User's primary email.
- `name` (String, optional): Display name.
- `isAnonymous` (bool): Whether the user is signed in anonymously (default: false).

## Storage Mapping

### StorageKeys (Core)
The following keys will be added to `lib/core/storage/storage_keys.dart`:
- `userId`: String
- `userEmail`: String
- `userName`: String

## State Transitions (AuthCubit)
1. **Initial** → **Loading** (on sign-in/up attempt)
2. **Loading** → **Authenticated** (on success)
3. **Authenticated** → **Unauthenticated** (on sign-out or token revocation)
4. **Any** → **Error** (on failure)

## Validation Rules
- `email`: Must follow standard RFC 5322 format.
- `name`: Must be at least 3 characters.
- `password`: Must be at least 6 characters.
