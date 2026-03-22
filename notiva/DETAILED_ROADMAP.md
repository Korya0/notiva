# 🗺️ NOTIVA: DETAILED TECHNICAL ROADMAP

This document breaks down each phase into the smallest possible technical steps to ensure full visibility and tracking.

---

## 🏗️ Phase 1: Foundation & Auth
### 1. Project Initialization
- [X] Initialize Flutter project: `flutter create --org com.korya notiva`.
- [x] Initialize Shorebird for code push: `shorebird init`.
- [x] Configure `Analysis Options` for strict linting.
- [ ] Setup Git workflow: `main`, `develop`, and `feature/*` branches.

### 2. Core Architecture Setup
- [ ] **Dependency Injection**: 
    - [ ] Install `get_it`.
    - [ ] Create `service_locator.dart`.
    - [ ] Implement `initDependencies()` and feature-based registration.
- [ ] **Routing & Navigation**:
    - [ ] Install `go_router`.
    - [ ] Define `AppRoutes` and `AppRouter` config (**Pattern E1**).
    - [ ] Implement `AuthGuard` redirect logic (**Pattern E2**).
- [ ] **Localization (L10n)**:
    - [ ] Setup `flutter_localizations` & `intl` (**Pattern A6**).
    - [ ] Create `app_en.arb` (Inter) and `app_ar.arb` (Cairo).
    - [ ] Implement `L10n` extension for context access.
- [ ] **Global State (B7)**:
    - [ ] Create `AppThemeCubit` for dynamic switching.
    - [ ] Create `AppLocaleCubit` for language switching.
- [ ] **Theme & Design**:
    - [ ] Create `AppColors` (Deep Purple #6C63FF).
    - [ ] Create `AppTextStyles` using `GoogleFonts` (Inter/Cairo).
    - [ ] Implement `Glassmorphism` utility.
    - [ ] Setup `AdaptiveTheme` for Light/Dark modes (**Pattern G7**).
- [ ] **Utilities**:
    - [ ] Implement `KeyboardDismisser` (**Pattern G13**).

### 3. UI Foundation
- [ ] **Splash Screen**:
    - [ ] Build `SplashScreen` with Shimmer Animation (**Pattern K6**).
    - [ ] Implement Auth check & navigation logic.
- [ ] **Onboarding Flow**:
    - [ ] Build 3-step Wizard (Notes, AI, OCR) (**Pattern B8**).
    - [ ] Implement "Get Started" persistence logic.

### 4. Authentication Flow
- [ ] **Firebase Setup**:
    - [ ] Create Firebase project and link via `flutterfire configure`.
    - [ ] Enable Auth (Email/Google), Firestore, and Storage.
- [ ] **Auth Feature**:
    - [ ] Build `AuthCubit` with `Sealed Classes` for states.
    - [ ] Build UI: Multi-step Onboarding (B8 Wizard logic).
    - [ ] Build UI: Login, Register, and Forgot Password screens.

---

## 📝 Phase 2: Core Note Management
### 1. Networking & Error Handling
- [ ] Build `DioFactory` with logging and auth interceptors.
- [ ] Implement `ApiResult` wrapper and `ErrorHandler` logic.
- [ ] Generate `Retrofit` clients for Firestore REST/Wrappers.

### 2. Local Storage (Offline-First)
- [ ] Initialize `Hive` and `HiveAdapter` for Notes/Folders/Tags.
- [ ] Implement `CacheManager` to handle TTL and invalidation.
- [ ] **Sync Engine**:
    - [ ] Create `SyncQueue` for pending local changes.
    - [ ] Implement background sync logic using `ConnectivityPlus`.

### 3. The Note Editor
- [ ] Integrate `flutter_quill` with custom minimal toolbar.
- [ ] Build `AutoSaveService` using `Debouncer`.
- [ ] Implement "Note Link" and "Checklist Mode" inside the editor.

### 4. Home & Management
- [ ] Build `SliverAppBar` with dynamic shrinking/expanding logic.
- [ ] Implement `NoteCard` with Grid/List layout toggle.
- [ ] Build Folders & Tags CRUD with `BottomSheet` dialogs.

---

## 🤖 Phase 3: AI & OCR Intelligence
### 1. OCR (Scan to Note)
- [ ] Integrate `google_mlkit_text_recognition`.
- [ ] Build Camera/Gallery picker UI.
- [ ] Implement `ImageCropper` integration.
- [ ] Offload OCR processing to a dedicated `Isolate`.

### 2. Gemini AI Integration
- [ ] Integrate `firebase_ai` for Gemini Pro access.
- [ ] Implement "Smart Summary" (Extract 3-5 key points).
- [ ] Implement "Smart Title" (Generate title from context).
- [ ] Implement "OCR Refinement" (AI fixes scan typos).

### 3. Media Attachments
- [ ] Build `StorageService` for Firebase Storage.
- [ ] Implement image compression before upload.
- [ ] Build thumbnail preview for notes.

---

## 💎 Phase 4: System Polish & Productivity
### 1. Export & Sharing
- [ ] Build PDF Export service using `pdf` and `printing` packages.
- [ ] Implement Native Share service via `share_plus`.
- [ ] Build "Print Note" functionality.

### 2. Organization Tools
- [ ] Build Trash & Archive management screens.
- [ ] Implement "Auto-Purge" logic for 30-day-old trash items.
- [ ] Implement `Local Notifications` for reminders.

### 3. Global Settings
- [ ] Build Profile screen with writing statistics.
- [ ] Implement Theme switching.

---

## 🚀 Phase 5: Monetization & Release
### 1. Premium & Growth
- [ ] Implement Premium Gating (Free vs. Pro limits).
- [ ] Integrate Ads (Optional).
- [ ] Setup `Firebase Remote Config` for dynamic feature flags.

### 2. Store Readiness
- [ ] Generate App Icons for all platforms.
- [ ] Create high-quality store screenshots.
- [ ] Finalize store presence (Metadata/Descriptions).
- [ ] Generate release builds and publish via Shorebird.

