# Feature Specification: Auth Security & Navigation Enhancements

**Feature Branch**: `002-auth-security-navigation`  
**Created**: 2026-03-26  
**Status**: Draft  
**Input**: User description: "Enhanced authentication security and reactive navigation."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Secure Session Management (Priority: P1)
**As a System**, I want to automatically sign out a user if their account is disabled or deleted in the backend, so that security is maintained and revoked tokens are not honored.

**Why this priority**: High. Prevents unauthorized access for deactivated accounts.

**Independent Test**: Can be tested by disabling a user in Firebase and verifying they are redirected to Login.

**Acceptance Scenarios**:
1. **Given** an authenticated user, **When** their account is disabled in Firebase, **Then** the app MUST detect the change via `idTokenChanges()` and sign them out.
2. **Given** a deactivated user, **When** they are signed out, **Then** an error dialog MUST inform them of the state.

---

### User Story 2 - Reactive & Seamless Navigation (Priority: P1)
**As a User**, I want to be redirected to the Home screen immediately after a successful login or signup, so I can start using the app without manual navigation.

**Why this priority**: High. Critical for standard UX.

**Independent Test**: Can be tested by performing a successful login/signup and verifying automatic navigation to `/home`.

**Acceptance Scenarios**:
1. **Given** a user on the Login screen, **When** they authenticate successfully, **Then** the app MUST navigate to the Home route automatically.
2. **Given** an authenticated user, **When** they attempt to access public routes (like Login), **Then** they MUST be redirected to Home.

---

### User Story 3 - Persistent User State (Priority: P2)
**As a User**, I want my login state to persist across app restarts, so I don't have to re-authenticate every time.

**Why this priority**: Medium. Important for UX and offline readiness.

**Independent Test**: Can be tested by restarting the app while logged in and verifying it starts on the Home screen.

**Acceptance Scenarios**:
1. **Given** a successful authentication, **When** the app starts, **Then** user metadata (ID, email, name) MUST be loaded from `AppStorage`.

---

## Requirements *(mandatory)*

### Functional Requirements
- **FR-001**: System MUST monitor authentication state using `idTokenChanges()` to detect token revocation.
- **FR-002**: System MUST show an error dialog using `AppDialogs` when an automatic logout occurs due to deactivation.
- **FR-003**: System MUST provide a reactive `refreshListenable` for `GoRouter` based on `AuthCubit`'s stream.
- **FR-004**: System MUST persist essential user metadata (excluding `isPremium`) into `AppStorage` upon successful sign-in/up.
- **FR-005**: System MUST clear all local user metadata from `AppStorage` upon sign-out.

### Key Entities
- **AuthUser**: Represents the currently authenticated user with attributes like `id`, `email`, and `name`.
- **AppStorage**: The persistence layer used to store and retrieve user metadata.

## Success Criteria *(mandatory)*

### Measurable Outcomes
- **SC-001**: Automatic logout occurs within one hour of account deactivation (standard Firebase refresh).
- **SC-002**: Users transition from Login to Home in under 500ms after authentication.
- **SC-003**: 100% of unauthenticated state transitions result in a redirect to the Login screen.

## Assumptions
- "Save user" refers to basic metadata (ID, name, email) and not complex profile data at this stage.
- Standard Firebase token refresh (1 hour) is acceptable for deactivation detection.

## Non-Negotiable Requirements (Notiva Constitution)
- **Documentation**: All code MUST be documented. Naming should be self-documenting.
- **Testing**: Unit tests are mandatory for the updated `AuthCubit`.
- **Architecture**: Clean Architecture boundaries must be respected.

