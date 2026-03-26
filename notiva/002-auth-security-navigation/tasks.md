# Tasks: Auth Security & Navigation Enhancements

**Input**: Design documents from `notiva/002-auth-security-navigation/`
**Prerequisites**: plan.md, spec.md, research.md, data-model.md

**Tests**: Unit tests are MANDATORY for `AuthCubit` changes per Principle VII of the Notiva Constitution.

## Phase 1: Setup (Shared Infrastructure) ✅ DONE
**Purpose**: Prepare the project for new auth keys and router configurations.

- [x] T001 [P] Add user metadata keys (`userId`, `userName`, `userEmail`) to `lib/core/storage/storage_keys.dart`
- [x] T002 Update `DIHelper` or `injection_container.dart` to ensure `AppStorage` is available for `AuthCubit`
- [x] T003 [P] Document the new auth architecture in `MISSION_EXPLANATION.md`

---

## Phase 2: Foundational (Blocking Prerequisites) ✅ DONE
**Purpose**: Core infrastructure changes that block all user stories.

- [x] T004 [P] Update `AuthRepository` interface in `lib/features/auth/domain/repositories/auth_repository.dart`
- [x] T005 Update `FirebaseAuthRepositoryImpl` in `lib/features/auth/data/repositories/firebase_auth_repository_impl.dart` to use `idTokenChanges()` instead of `authStateChanges()`
- [x] T006 Implement `GoRouterRefreshStream` helper in `lib/core/router/app_router.dart` (if not already present) to handle BLoC-to-Router reactivity

---

## Phase 3: User Story 1 - Secure Session Management (Priority: P1) 🎯 MVP ✅ DONE
**Goal**: Automatically sign out users when their account is disabled/deleted.

### Implementation for User Story 1
- [x] T007 [US1] Update `AuthCubit` in `lib/features/auth/presentation/cubit/auth/auth_cubit.dart` to listen for null user/token revocation from repository
- [x] T008 [US1] Implement `showErrorDialog` call in `AuthCubit` or a global listener using `AppDialogs.showErrorDialog` from `lib/core/common/widgets/app_dialogs.dart` when deactivation is detected
- [x] T009 [US1] Create unit test in `test/features/auth/presentation/cubit/auth_cubit_test.dart` to verify sign-out on null user from stream

---

## Phase 4: User Story 2 - Reactive & Seamless Navigation (Priority: P1) ✅ DONE
**Goal**: Automatic redirect to `/home` on login/signup and `/login` on logout.

### Implementation for User Story 2
- [x] T010 [US2] Update `AppRouter` in `lib/core/router/app_router.dart` to include `refreshListenable` using the `AuthCubit` stream
- [x] T011 [US2] Refactor `AuthGuard` in `lib/core/router/auth_guard.dart` to read `Authenticated` state directly from `AuthCubit` inside the `redirect` logic
- [x] T012 [US2] Remove manual navigation calls from login/signup BLoC listeners in `lib/features/auth/presentation/pages/` to rely on router reactivity

---

## Phase 5: User Story 3 - Persistent User State (Priority: P2) ✅ DONE
**Goal**: Persist user metadata locally to support restarts and offline context.

### Implementation for User Story 3
- [x] T013 [P] [US3] Update `AuthCubit` state `Authenticated` to include user metadata (ID, Email, Name)
- [x] T014 [US3] Implement saving of user metadata to `AppStorage` in `AuthCubit._onUserChanged`
- [x] T015 [US3] Implement loading of user metadata from `AppStorage` during `AuthCubit` initialization in `lib/features/auth/presentation/cubit/auth/auth_cubit.dart`
- [x] T016 [US3] Ensure `AuthCubit.logout()` clears user metadata from `AppStorage` using `storage.remove()`

---

## Phase 6: Polish & Cross-Cutting Concerns ✅ DONE
**Purpose**: Final audits and documentation.

- [x] T017 [P] Verify `userDisabled` localization string is used correctly from `lib/l10n/app_en.arb`
- [x] T018 Code cleanup in `lib/features/auth/presentation/cubit/auth/auth_cubit.dart` (removing any legacy authState listeners)
- [x] T019 Run quickstart.md validation steps locally
