# 🏢 PROJECT CONTEXT: Notiva

> **AI INSTRUCTION:** Read this for business logic and roadmap. Keep responses focused on these constraints.

---

## 📋 1. Business Context
- **Product Name:** Notiva
- **Goal:** Smart Note-Taking with AI Summarization, OCR Scanning, and Offline-First synchronization.
- **Infrastructure:** Firebase (Auth, Firestore, Storage) / Shorebird (Code Push).
- **Localization:** Arabic (Priority) & English.

## 🧩 2. Project-Specific Stack
- **State:** `flutter_bloc` (Cubit + Sealed Classes).
- **Networking:** `dio` + `retrofit`.
- **Navigation:** `go_router`.
- **Storage:** `hive_flutter` for local caching.
- **AI:** Google Gemini AI (Vertex AI/Firebase AI).
- **OCR:** Google ML Kit Text Recognition.

## 🧠 3. Domain Rules (Critical)
1. **Offline-First:** All writes must go to Hive first.
2. **Sync Strategy:** Firebase sync happens in background; user sees "synced/pending" status.
3. **AI Limits:** Freemium model with daily limits for non-premium users.
4. **Rich Text:** `flutter_quill` is the primary editor tool.

## ✅ 4. Roadmap & Status
- Phase 1: Foundation
    - [x] Project Setup & Renaming
    - [x] Git Workflow & Architecture Rules
    - [x] Initial Documentation (Spec, README, Context)
- Phase 2: Core Infrastructure
    - [ ] DI, Router, Theme, Networking (Retrofit)
    - [ ] Local Storage (Hive) & Offline-First Strategy
    - [ ] Onboarding & Auth Flow (Firebase)
- Phase 3: Note Management
    - [ ] Note Editor (Quill) & Auto-save
    - [ ] Folders & Tags Management
    - [ ] Home Screen & Search (Filtered)
- Phase 4: AI & OCR Features
    - [ ] ML Kit OCR (Isolate processing)
    - [ ] Gemini AI (Summarization, Suggestions)
- Phase 5: Polish & Deployment
    - [ ] PDF Export, Trash/Archive, Notifications
    - [ ] Localization & Premium Gating
    - [ ] Store Listing & CI/CD (Shorebird)
