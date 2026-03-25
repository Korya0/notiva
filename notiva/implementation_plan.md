# 🏗️ [SENIOR-TO-TECH-LEAD] MISSION: AUTHENTICATION FLOW
**Owner**: Antigravity (Senior) | **Approver**: User (Tech Lead)

## 🎯 Goal
Implement a premium, secure, and performant Authentication system (Android, iOS, Web).

### 📝 Mission Protocol
- **Tracking**: A dedicated [MISSION_EXPLANATION.md](file:///d:/flutter/flutter_Projects/notiva/notiva/MISSION_EXPLANATION.md) will track every step's justification.
- **Code Style**: **NO comments** unless critical. Reusable widgets first.
- **Execution**: Point-by-point discussion.

---

### 🛠️ Phase 0: Infrastructure & Standards
- #### [NEW] [app_logger.dart](file:///d:/flutter/flutter_Projects/notiva/lib/core/utils/app_logger.dart) (Debug Print / Crashlytics)
- #### [NEW] [app_bloc_observer.dart](file:///d:/flutter/flutter_Projects/notiva/lib/core/utils/app_bloc_observer.dart)
- #### [NEW] [connectivity_service.dart](file:///d:/flutter/flutter_Projects/notiva/lib/core/utils/connectivity_service.dart)
- #### [NEW] [app_dialogs.dart](file:///d:/flutter/flutter_Projects/notiva/lib/core/common/widgets/app_dialogs.dart)
  - **Logic**: Reusable, platform-aware dialogs (Material/Cupertino) for error reporting (No SnackBar).

---

### 🏗️ Phase 1: Domain Layer
- #### [NEW] [auth_user.dart](file:///d:/flutter/flutter_Projects/notiva/lib/features/auth/domain/entities/auth_user.dart)
- #### [NEW] [auth_failure.dart](file:///d:/flutter/flutter_Projects/notiva/lib/features/auth/domain/entities/auth_failure.dart)
- #### [NEW] [auth_repository.dart](file:///d:/flutter/flutter_Projects/notiva/lib/features/auth/domain/repositories/auth_repository.dart)
- #### [NEW] [auth_use_cases](file:///d:/flutter/flutter_Projects/notiva/lib/features/auth/domain/use_cases/)

---

### 📦 Phase 2: Data Layer
- #### [NEW] [firebase_auth_repository_impl.dart](file:///d:/flutter/flutter_Projects/notiva/lib/features/auth/data/repositories/firebase_auth_repository_impl.dart)
- #### [NEW] [auth_mapper.dart](file:///d:/flutter/flutter_Projects/notiva/lib/features/auth/data/mappers/auth_mapper.dart)

---

### 🎨 Phase 3: "Luxurious Minimalism" (Solid & Deep)
- #### [NEW] [auth_screen.dart](file:///d:/flutter/flutter_Projects/notiva/lib/features/auth/presentation/views/auth_screen.dart)
  - **Concept**: A deep, rich solid background (Dark Indigo/Charcoal) using a very subtle radial gradient for focus.
- #### [NEW] [auth_premium_card.dart](file:///d:/flutter/flutter_Projects/notiva/lib/features/auth/presentation/widgets/auth_premium_card.dart)
  - **Design**: **Solid Surface** with soft, layered shadows (Elevation: 8) and a 0.5px high-contrast accent border.
  - **Logic**: Integrates `AuthFormCubit` and `AuthCubit` for the login/signup flow.
- #### [NEW] [staggered_auth_fields.dart](file:///d:/flutter/flutter_Projects/notiva/lib/features/auth/presentation/widgets/staggered_auth_fields.dart)
  - **Animations**: Liquid-like staggered entry animations for all form fields.
- #### [NEW] [social_auth_premium_buttons.dart](file:///d:/flutter/flutter_Projects/notiva/lib/features/auth/presentation/widgets/social_auth_premium_buttons.dart)
  - **Aesthetics**: High-contrast, solid-color buttons for Google/Apple sign-in with premium branding icons.
  - **Widgets**: Reusing `AppButton`, `AppLoadingIndicator`, `GlassContainer`.
  - **Animations**: `FadeInSlide`.

---

### 🧪 Phase 5: Comprehensive Testing
- **Unit Tests**: Cubit (B3 logic), UseCases, Mappers.
- **Widget Tests**: `AppTextField`, `AppDialogs`, Wizard Steps.
- **Integration Tests**: Connectivity, Firebase Auth Flows.
