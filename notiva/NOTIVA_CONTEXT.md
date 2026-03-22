# 🏢 PROJECT CONTEXT: Notiva

> **AI INSTRUCTION:** Read this for business logic and roadmap. Keep responses focused on these constraints.

---

## 📋 1. Business Context
- **Product Name:** Notiva
- **Goal:** Smart Note-Taking with AI Summarization, OCR Scanning, and Offline-First synchronization.
- **Infrastructure:** Firebase (Auth, Firestore, Storage) / Shorebird (Code Push).
- **Localization:** Arabic (Priority) & English.
- **Branding Colors:** Deep Navy Blue (#001F3F) & Vibrant Teal (#008080).

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
> **See Detailed Roadmap here:** [DETAILED_ROADMAP.md](file:///d:/flutter/flutter_Projects/notiva/notiva/DETAILED_ROADMAP.md)

- **Phase 1: Foundation & Auth** (Current Focus: DI, GoRouter, L10n)
- **Phase 2: Core Note Management**
- **Phase 3: AI & OCR Intelligence**
- **Phase 4: System Polish & Productivity**
- **Phase 5: Monetization & Release**

> **See Ultra-Detailed Technical Roadmap here:** [DETAILED_ROADMAP.md](file:///d:/flutter/flutter_Projects/notiva/notiva/DETAILED_ROADMAP.md)
