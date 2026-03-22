# 🗺️ NOTIVA: DETAILED TECHNICAL ROADMAP

This document breaks down each phase into the smallest possible technical steps to ensure full visibility and tracking.

---

## 🏗️ Phase 1: Foundation & Auth
### 1. Project Initialization
- [X] Initialize Flutter project: `flutter create --org com.korya notiva`.
- [x] Initialize Shorebird for code push: `shorebird init`.
- [x] Configure `Analysis Options` for strict linting.
- [ ] Setup Git workflow: `main`, `develop`, and `feature/*` branches.
- [x] **App Branding & Identity**:
    - [x] Update App Name (`Notiva`) for all platforms.
    - [x] Setup `flutter_launcher_icons` for multi-platform App Logos.
    - [x] Setup `flutter_native_splash` for a professional Native Splash screen.


### 2. Core Architecture Setup
- [x] **Dependency Injection**: 
    - [x] Install `get_it`.
    - [x] Create `service_locator.dart`.
    - [x] Implement `initDependencies()` and feature-based registration.
- [x] **Routing & Navigation**:
    - [x] Install `go_router`.
    - [x] Define `AppRoutes` and `AppRouter` config (**Pattern E1**).
    - [x] Implement `AuthGuard` redirect logic (**Pattern E2**).
- [x] **Localization (L10n)**:
    - [x] Setup `flutter_localizations` & `intl` (**Pattern A6**).
    - [x] Organize and register `AppFonts` (`Outfit` & `IBM Plex Sans Arabic`).
    - [x] Implement `L10n` extension for context access.
- [x] **Global State (B7)**:
    - [x] Create `AppThemeCubit` for dynamic switching.
    - [x] Create `AppLocaleCubit` for language switching.
- [ ] **Theme & Design**:
    - [ ] Create `AppColors` (Deep Navy Blue #001F3F & Vibrant Teal #008080).
    - [ ] Create `AppTextStyles` using `GoogleFonts` or registered assets.
    - [ ] Implement `Glassmorphism` utility.
    - [ ] Setup `AdaptiveTheme` for Light/Dark modes (**Pattern G7**).
- [ ] **Utilities**:
    - [ ] Implement `KeyboardDismisser` (**Pattern G13**).

### 3. UI Foundation
- [ ] **Splash Screen**:
    - [ ] Build `SplashScreen` with Shimmer Animation (**Pattern K6**).
    - [ ] Implement `locator.allReady()` check to wait for async dependencies.
    - [ ] Implement Auth check & navigation logic.
- [ ] **Onboarding Flow**:
    - [ ] Build 3-step Wizard (Notes, AI, OCR) (**Pattern B8**).
    - [ ] Implement "Get Started" persistence logic.

### 4. Authentication Flow
- [ ] **Firebase Setup**:
    - [ ] Create Firebase project and link via `flutterfire configure`.
    - [ ] Enable Auth (Email/Google), Firestore, and Storage.
    - [ ] Integrate **Firebase Crashlytics** for real-time error tracking.
    - [ ] Integrate **Firebase Analytics** for user activity & "Most visited screens".
    - [ ] Integrate **Firebase Performance Monitoring**.
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
- [x] Generate App Icons for all platforms.
- [ ] Create high-quality store screenshots.
- [ ] Finalize store presence (Metadata/Descriptions).
- [ ] Generate release builds and publish via Shorebird.

