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

### 🎨 Phase 3: Presentation Layer (UI & State)
- #### [NEW] [auth_cubit.dart](file:///d:/flutter/flutter_Projects/notiva/lib/features/auth/presentation/cubit/auth_cubit.dart)
  - **Pattern**: **B3 Form Validation**. Manages values, errors (Maps), and `FormStatus`.
- #### [NEW] [app_text_field.dart](file:///d:/flutter/flutter_Projects/notiva/lib/core/common/widgets/app_text_field.dart)
  - **Logic**: Reusable and platform-aware (iOS specific details handled).
- #### [NEW] [auth_wizard_view.dart](file:///d:/flutter/flutter_Projects/notiva/lib/features/auth/presentation/views/auth_wizard_view.dart)
  - **Layout**: **CustomScrollView** with elastic bouncing.
  - **Widgets**: Reusing `AppButton`, `AppLoadingIndicator`, `GlassContainer`.
  - **Animations**: `FadeInSlide`.

---

### 🧪 Phase 5: Comprehensive Testing
- **Unit Tests**: Cubit (B3 logic), UseCases, Mappers.
- **Widget Tests**: `AppTextField`, `AppDialogs`, Wizard Steps.
- **Integration Tests**: Connectivity, Firebase Auth Flows.
