# 🏗️ ARCHITECTURE & STATE (CONCISE)

### Layer Boundaries
`Presentation (UI/Bloc) -> Domain (Use Cases/Entities/Repo Interfaces) -> Data (Repos/DTOs/API)`
- **Forbidden:** Business logic in UI; direct Repo access in UI; API models in Domain.

### 🎯 State Management & DI
- **Cubit (Default):** Use for UI logic. Use **Sealed Classes** for states (No Freezed). Use `switch` in UI.
- **Dependency Injection (GetIt):** Constructor injection always. Use `DIHelper.registerFeature()` or `lazySingleton`/`factory`.

### 🌐 Networking & Data
- **Separation:** Keep Entities and DTOs separate. Map DTOs to Domain Entities.
- **Error Handling:** No silent failures. All error paths must be handled (e.g., `ApiResult`).

### 📚 Templates & Patterns
- **Rule:** Never reinvent the wheel. Check the central template library at `D:/flutter/flutter_standard_library/Templates/` for blueprints. 
- **Action:** Read a specific template or the `template_catalog.md` ONLY when starting a relevant feature/layer.
