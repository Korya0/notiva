# Data Model: Auth Session Validation

## Authentication Entities

### AuthUser (Existing)
*No changes to the entity structure.*

## State Transitions & AuthState Flow

### AuthState (Sealed Class)

The `AuthSessionExpired` state is a critical marker for this feature.

| State | Trigger | Action |
|-------|---------|--------|
| `AuthInitial` | App startup. | Load persisted user. |
| `AuthAuthenticated` | User found in local storage OR successful login. | Emit immediately; background validation. |
| `AuthSessionExpired` | `user.reload()` fails (disabled/deleted). | Show error dialog; clear persistence; emit `AuthUnauthenticated`. |
| `AuthUnauthenticated` | Logout or no session found. | Show login screen. |

## Persistence

### StorageKeys (Existing)
- `userId`: String
- `userEmail`: String
- `userName`: String

### Persistence Lifecycle
1. **On Login**: Write all keys to `AppStorage`.
2. **On Logout/Expiry**: Clear all keys from `AppStorage`.
3. **On Validation Failure**: Clear all keys and emit `AuthSessionExpired`.
