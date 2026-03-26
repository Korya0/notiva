# Tasks: Auth Session Validation

**Input**: Design documents from `/specs/002-auth-session-validation/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md

**Tests**: Unit tests are MANDATORY for Cubits and Repositories per the project constitution.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2)
- Include exact file paths in descriptions

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure

- [x] T001 Initialize feature branch and directory structure (Completed by /speckit.specify)
- [x] T002 Setup implementation plan and research docs (Completed by /speckit.plan)

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

- [x] T003 [P] Define `validateSession()` in `lib/features/auth/domain/repositories/auth_repository.dart`
- [x] T004 Implement `validateSession()` (using `_firebaseAuth.currentUser?.reload()`) in `lib/features/auth/data/repositories/firebase_auth_repository_impl.dart`

**Checkpoint**: Foundation ready - user story implementation can now begin.

---

## Phase 3: User Story 1 - Automatic Logout for Disabled Users (Priority: P1) 🎯 MVP

**Goal**: Ensure disabled Firebase accounts are automatically logged out on app start.

**Independent Test**: Disable a user in Firebase Console, restart app, verify `AuthSessionExpired` is emitted and user is redirected to Login.

### Tests for User Story 1 (MANDATORY) ⚠️

> **NOTE: Write these tests FIRST, ensure they FAIL before implementation**

- [x] T005 [P] [US1] Unit test for `validateSession()` handling `user-disabled` in `test/features/auth/data/repositories/firebase_auth_repository_impl_test.dart`
- [x] T006 [P] [US1] Unit test for `AuthCubit` emitting `AuthSessionExpired` on validation failure in `test/features/auth/presentation/cubit/auth_cubit_test.dart`

### Implementation for User Story 1

- [x] T007 [US1] Call `_authRepository.validateSession()` in `AuthCubit._init()` background in `lib/features/auth/presentation/cubit/auth/auth_cubit.dart`
- [x] T008 [US1] Ensure `FirebaseAuthErrorMapper` correctly maps `user-disabled` in `lib/features/auth/data/mappers/firebase_auth_error_mapper.dart`

**Checkpoint**: User Story 1 should be functional independently.

---

## Phase 4: User Story 2 - Automatic Logout for Deleted Users (Priority: P1)

**Goal**: Ensure deleted Firebase accounts are automatically logged out on app start.

**Independent Test**: Delete a user in Firebase Console, restart app, verify redirection to login.

### Implementation for User Story 2

- [x] T009 [US2] Verify `validateSession()` handles `user-not-found` error during `reload()` in `lib/features/auth/data/repositories/firebase_auth_repository_impl.dart`

---

## Phase 5: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple user stories

- [x] T010 [P] Update `MISSION_EXPLANATION.md` (if exists) with rationale for startup validation. (N/A - File doesn't exist)
- [x] T011 Verify constitution compliance (Line length < 80, no Freezed, Sealed states).

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: Completed.
- **Foundational (Phase 2)**: T003-T004 MUST complete first.
- **User Stories (Phase 3+)**: US1 and US2 can proceed in parallel (shared logic).
- **Polish (Final Phase)**: After story completion.

### Parallel Opportunities

- T003 and T005 can be started in parallel (Interface vs Repository Test).
- T006 can be written in parallel with T005.

## Parallel Example: User Story 1

```bash
# Prepare tests in parallel
Task: "T005 [P] [US1] Unit test for validateSession() in firebase_auth_repository_impl_test.dart"
Task: "T006 [P] [US1] Unit test for AuthCubit validation in auth_cubit_test.dart"
```

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Foundational logic (T003-T004).
2. Implement US1 tests (T005-T006).
3. Implement US1 logic (T007-T008).
4. **STOP and VALIDATE**: Test disabled user flow manually.
