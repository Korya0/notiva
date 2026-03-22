# 🗺️ NOTIVA: DETAILED TECHNICAL ROADMAP

This document breaks down each phase into granular steps to ensure full technical visibility and tracking.

---

## 🏗️ Phase 2: Core Infrastructure (Current Focus)

### 1. Dependency Injection (DI)
- [ ] Install `get_it`.
- [ ] Create `DependencyInjection` helper class.
- [ ] Implement `registerFeature()` pattern for modularity.

### 2. Basic Routing
- [ ] Install `go_router`.
- [ ] Configure `AppRouter` with initial routes (Splash, Login, Home).
- [ ] Implement `AuthGuard` logic for protected routes.

### 3. Design System & Theme
- [ ] Configure `GoogleFonts` (Inter for En, Cairo for Ar).
- [ ] Implement `AppTheme` (Light/Dark mode) with Glassmorphism tokens.
- [ ] Create `AppColors` and `AppTextStyles` constants.

### 4. Networking Layer
- [ ] Install `dio` and `retrofit`.
- [ ] Implement `DioFactory` with interceptors (Logging, Auth, Errors).
- [ ] Create `ApiResult` and `ErrorHandler` for unified response handling.

### 5. Local Storage & Offline Strategy
- [ ] Install `hive` and `hive_flutter`.
- [ ] Initialize Hive for persistence.
- [ ] Design the `SyncStrategy` (Local writes → Queue → Background Push).

---

## 📝 Phase 3: Note Management (The Core Feature)

### 1. Feature Architecture (Notes)
- [ ] Create Data layer (DTOs, Repositories).
- [ ] Create Domain layer (Entities, Use Cases).
- [ ] Setup `NotesCubit` with Sealed States.

### 2. The Editor (Rich Text)
- [ ] Install `flutter_quill`.
- [ ] Implement `NoteEditor` with custom toolbar.
- [ ] Implement `Debouncer` for auto-saving logic.

### 3. Home Screen & Organization
- [ ] Implement `SliverAppBar` with search and filters.
- [ ] Create `NoteCard` component (Grid/List views).
- [ ] Implement Folders and Tags management (CRUD).
- [ ] Setup Search feature (Title/Content/Tags).

---

## 🤖 Phase 4: AI & OCR Features

### 1. OCR (Optical Character Recognition)
- [ ] Install `google_mlkit_text_recognition` and `image_picker`.
- [ ] Implement Camera/Gallery flow with `ImageCropper`.
- [ ] Move OCR processing to an `Isolate` for performance.

### 2. Gemini AI Integration
- [ ] Integrate Firebase Vertex AI / Gemini API.
- [ ] Implement `summarizeNote` use case.
- [ ] Implement `suggestTitle` based on note content.
- [ ] Add "AI Enhancement" for OCR results.

### 3. Media Management
- [ ] Setup `Firebase Storage` repository.
- [ ] Implement image upload progress and caching.

---

## 💎 Phase 5: Polish & Deployment

### 1. System Features
- [ ] Implement Multi-Tab `Trash` and `Archive`.
- [ ] Add `Local Notifications` (Reminders).
- [ ] Export to PDF service using `pdf` package.

### 2. Localization & Global Settings
- [ ] Complete `l10n` (Arabic as priority, English).
- [ ] Settings screen (Language, Theme, Reset).

### 3. Monetization & Security
- [ ] Implement Premium Gating (Features vs. Free limit).
- [ ] Integrate Ads (Optional).
- [ ] Configure Shorebird for Code Push.

### 4. Release
- [ ] Prepare Store Assets (Icons, Screenshots).
- [ ] Generate Release Builds (Android, iOS, Web).
- [ ] Publish to Play Store & App Store.
