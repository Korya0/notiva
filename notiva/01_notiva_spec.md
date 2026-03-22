# 📱 Notiva — الملف التفصيلي الكامل

> **مدونة ذكية + OCR + AI Summarizer + Offline-First**
> المشروع الأول — يغطي 32 تمبليت — الأساس لكل المشاريع اللاحقة.

---

## 📋 معلومات المشروع

| البند | التفصيل |
|-------|---------|
| **اسم التطبيق** | Notiva |
| **المنصات** | Android, iOS, Web |
| **Backend** | Firebase (Firestore + Storage + Auth) |
| **Code Push** | Shorebird |
| **UI/UX** | Google Stitch |
| **مدة التنفيذ** | 5 أسابيع |
| **نموذج الربح** | Freemium + Ads |
| **اللغات** | عربي + إنجليزي |
| **Primary Color** | Deep Purple (#6C63FF) |
| **Font** | Inter (En) / Cairo (Ar) |
| **Style** | Minimalist + Glassmorphism |

---

## 📱 الشاشات الكاملة (17 شاشة)

### S01: Splash Screen
- شعار التطبيق + Shimmer Animation
- **تمبليت:** `K6` Asset Preloader
- **سلوك:** 2 ثانية → تحقق Auth → أول مرة? Onboarding : مسجل? Home : Login

### S02: Onboarding (3 خطوات)
- **تمبليت:** `B8` Multi-Step Wizard Cubit
- **خطوة 1:** "ملاحظات بلا حدود" — اكتب أفكارك بأي شكل
- **خطوة 2:** "ذكاء اصطناعي" — لخّص أي ملاحظة بضغطة
- **خطوة 3:** "مسح ذكي" — صوّر مستند وحوّله لنص
- أزرار: Next / Skip / Get Started
- Dot Indicator + PageView
- تخزين: `SharedPreferences: onboarding_completed = true`
- **Navigation:** → Login أو Register

### S03: Auth Wrapper (غير مرئية)
- GoRouter redirect logic
- **تمبليت:** `E2` Auth Route Guard
- يتحقق من `AuthCubit.state` → يوجه المستخدم

### S04: Login Screen
- **تمبليت:** `G3` Form + `B3` Form Validation Cubit + `G13` Keyboard Manager
- **حقول:** Email + Password (obscure toggle)
- **أزرار:** Login | "سجل الآن" → S05 | "نسيت كلمة المرور?" → S05b | Google Sign-In
- **Validation:** Email format + Password min 6
- **Loading:** Button → CircularProgressIndicator
- **Error:** SnackBar (`G10`)
- **Success:** → Home

### S05: Register Screen
- **تمبليت:** `G3` + `B3`
- **حقول:** Name, Email, Password (+ strength indicator), Confirm Password
- **Validation:** Name min 2, Email format, Password (min 6 + uppercase + number), Confirm match
- **Success:** Firebase createUser → Home

### S05b: Forgot Password
- **تمبليت:** `A2` Simple CRUD
- حقل Email فقط → Firebase sendPasswordResetEmail → SnackBar → Back

### S06: Home Screen ⭐ (الشاشة الرئيسية)
- **تمبليت:** `G1` + `G9` Slivers + `B2` Paginated + `G8` Shimmer + `G2`
- **SliverAppBar (Collapsing):**
  - Title: "SmartNote"
  - Actions: Search Icon (→ S11), Settings (→ S13)
  - Bottom: Folder/Tag Filter Chips (horizontal scroll)
- **Body:** ملاحظات بنمطين (Grid 2-col / List) — toggle button
- **بطاقة الملاحظة:**
  - Title (bold, max 2 lines) + Preview (3 lines, faded)
  - Tags (colored chips) + Date (relative) + Folder dot + Sync icon
- **Empty State:** `G5` — "لا توجد ملاحظات" + illustration
- **Loading:** `G8` Shimmer skeleton cards
- **FAB (SpeedDial):** ✏️ ملاحظة جديدة (→ S07) | 📷 OCR (→ S09)
- **Pull to Refresh** → force sync
- **Infinite Scroll** → `B2` Paginated
- **Swipe:** Right=Archive, Left=Delete (with undo)
- **Long Press:** Multi-select → Bulk actions

### S07: Note Editor ⭐⭐ (الأهم)
- **تمبليت:** `A1` Full Feature + `B1` Cubit + `K3` Debouncer + `G13` Keyboard
- **AppBar Actions:** 🤖 AI Summary | 📂 Move Folder | 🏷️ Tags | ↗️ Share | 📄 PDF | ⋮ More
- **Body:** Rich Text Editor (`flutter_quill`)
  - Toolbar: Bold, Italic, H1-H3, Lists, Checkbox, Code Block, Link, Image
- **Auto-save:** Debouncer كل 2 ثانية → Hive → Firebase
- **Word Count** في الأسفل

### S08: Note Detail / Preview
- **تمبليت:** `G9` Slivers
- SliverAppBar مع cover image + Edit/Share/Delete actions
- Rendered Rich Text (read-only) + Tags + Dates
- FAB: ✏️ Edit → S07

### S09: OCR Camera Screen ⭐
- **تمبليت:** `K1` Isolate + `F9` Permissions
- **Flow:** كاميرا/Gallery → Preview → Crop → "مسح النص" → Isolate processing → نص قابل للتعديل → [AI تحسين] → "إنشاء ملاحظة" → S07
- **Native:** MethodChannel لـ ML Kit OCR
- الصورة تُرفع لـ Firebase Storage (`C8`)

### S10: AI Summary Bottom Sheet ⭐
- **تمبليت:** `G6` Adaptive Dialog
- يُفتح من S07 أو S08
- Shimmer أثناء انتظار Gemini → Result (3-5 نقاط)
- Actions: 📋 Copy | 📝 Create Note | ↗️ Share
- **Premium Gate:** Free: 5/day | Premium: Unlimited

### S11: Search Screen
- **تمبليت:** `B4` Search/Filter + `K3` Debouncer
- Search Bar (auto-focus) + Debounced 300ms
- Filter Chips: All, Folder, Tag, Date + Sort
- يبحث في: Title + Content + Tags
- **AI Smart Search (Bonus):** Gemini يفهم سياق البحث

### S12: Export PDF Preview
- **تمبليت:** `C10` File Download
- PDF rendered preview + Actions: 💾 Save | ↗️ Share (MethodChannel) | 🖨️ Print

### S13: Settings Screen
- **تمبليت:** `A2` + `B7` Global Cubit
- **المظهر:** Theme Toggle + Font Size + Default View
- **اللغة:** العربية / English
- **المزامنة:** Toggle + Sync Now + Last sync
- **الحساب:** Profile | Change Password | Logout | Delete Account
- **Premium:** Banner "🌟 ترقية"

### S14: Profile Screen
- Avatar (changeable) + Name (editable) + Email (readonly)
- **إحصائيات:** Total notes, Folders, Monthly notes, AI usage, Storage

### S15: Folders Management
- **تمبليت:** `A2` + `B1`
- List: Name + Color dot + Note count + Reorderable
- ➕ Add (Dialog: Name + Color) | ✏️ Edit | 🗑️ Delete

### S16: Tags Management — `A2` Simple CRUD
- Wrap of Tag chips + Create/Edit/Delete

### S17: Trash / Archive
- **تمبليت:** `B5` Multi-Tab (Trash tab + Archive tab)
- Trash auto-delete 30 days | Restore / Delete Permanently | Empty Trash

---

## 🔄 User Flows

### Flow 1: أول فتح
```
Splash → Onboarding (3 steps) → Login/Register → Home
```

### Flow 2: مستخدم عائد
```
Splash → Auth check → Home (مباشرة) أو Login
```

### Flow 3: إنشاء ملاحظة
```
Home → FAB "✏️" → Editor (blank) → كتابة → Auto-save (Hive → Firebase) → Back → Home
```

### Flow 4: مسح OCR
```
Home → FAB "📷" → Permission check → Camera → Preview/Crop → "مسح" → Isolate OCR → نص → [AI تحسين] → "إنشاء ملاحظة" → Editor
```

### Flow 5: تلخيص AI
```
Editor/Detail → 🤖 → Check premium/free limit → Bottom Sheet → Shimmer → Gemini → Result → Copy/New Note/Share
```

### Flow 6: البحث
```
Home → Search icon → S11 → Type (debounced) → Results → Filters → Tap → Note Detail
```

### Flow 7: المزامنة
```
Auto: Write → Hive (instant) → Online? Firebase : Mark "pending" → Later: Connectivity restored → Batch sync
Manual: Pull to Refresh → Force sync → SnackBar
```

### Flow 8: تصدير PDF
```
Note Detail → "📄 PDF" → Preview → Save/Share (MethodChannel)/Print
```

### Flow 9: تسجيل خروج
```
Settings → "خروج" → Confirm → Firebase signOut → Clear cache → Login
```

---

## 🗄️ Data Models

### Note
```dart
// DTO — D2 JsonSerializable
class NoteDto {
  String id, title, plainContent, richContent;
  String? folderId, coverImageUrl;
  List<String> tagIds, imageUrls;
  NoteStatus status; // active, archived, trashed
  bool isPinned;
  DateTime createdAt, updatedAt;
  DateTime? trashedAt;
  String userId;
  int syncVersion;
  bool isSynced;
}

// Entity — D3 Equatable
class NoteEntity extends Equatable {
  // Same fields without sync-related ones
}

// Local — D6 Hive
@HiveType(typeId: 0)
class NoteLocal extends HiveObject {
  // All fields + pendingDelete flag
}
```

### Other Models
```dart
class FolderDto { String id, name, colorHex; int sortOrder, noteCount; }
class TagDto { String id, name, colorHex; int usageCount; }
class UserDto { String id, name, email; bool isPremium; AppSettings settings; }
class AppSettings { String themeMode, locale, defaultView, fontSize; bool autoSync; }
```

### Enums — D5
```dart
enum NoteStatus { active, archived, trashed }  // @JsonValue
enum SyncStatus { synced, pending, conflict }
```

---

## 🌐 Firebase Structure

### Firestore
```
users/{userId}/           → name, email, settings, isPremium
users/{userId}/notes/     → title, content, folderId, tagIds, status, syncVersion
users/{userId}/folders/   → name, colorHex, sortOrder, noteCount
users/{userId}/tags/      → name, colorHex, usageCount
```

### Storage
```
users/{userId}/notes/{noteId}/images/{imageId}.jpg
users/{userId}/profile/avatar.jpg
```

### Auth: Email/Password + Google Sign-In + Password Reset

---

## 🧩 Clean Architecture Structure

```
lib/
  core/
    di/          → H1 Core DI
    networking/  → C1 Dio + C3 ApiResult
    router/      → E1 GoRouter + E2 Auth Guard + E3 Shell
    theme/       → G7 Theme
    common/      → G5 States + G10 Snackbar
    utils/       → K3 Debouncer
    l10n/        → A6 Localization

  features/
    auth/        → A2 (Login, Register, Forgot)
    notes/       → A1 Full Feature (data/domain/presentation)
    ocr/         → K1 Isolate + Camera
    ai/          → Gemini Service + Summary Sheet
    folders/     → A2 CRUD
    tags/        → A2 CRUD
    settings/    → A2 + B7 Global Cubits
    onboarding/  → B8 Multi-Step
    export/      → PDF Service
    trash/       → B5 Multi-Tab
```

---

## 📱 Native Platform Channels

### 1. Native Share (MethodChannel)
```dart
class NativeShareService {
  static const _channel = MethodChannel('com.smartnote/share');
  Future<void> shareText(String text, String subject) async => ...;
  Future<void> shareFile(String path, String mimeType) async => ...;
}
```

### 2. Native File Picker (MethodChannel)
```dart
class NativeFilePicker {
  static const _channel = MethodChannel('com.smartnote/files');
  Future<String?> pickDocument() async => ...;
}
```

---

## 🤖 Gemini AI
```dart
class GeminiService {
  Future<String> summarizeNote(String content, String locale);
  Future<String> suggestTitle(String content);
  Future<String> enhanceOcrText(String rawText);
}
```

---

## ✨ ميزات بونص
1. 📌 Pin Notes | 2. 🎨 Note Color | 3. ✅ Checklist Mode
4. ⭐ Favorites | 5. 🗓️ Reminders (Local Notification)
6. 📊 Writing Statistics | 7. 🔗 Note Linking

---

## 📦 Packages الرئيسية
`flutter_bloc`, `get_it`, `go_router`, `dio`, `retrofit`, `hive_flutter`,
`firebase_core/auth/firestore/storage`, `firebase_ai`, `flutter_quill`,
`shimmer`, `cached_network_image`, `google_fonts`, `image_picker`,
`google_mlkit_text_recognition`, `pdf`, `printing`, `share_plus`,
`shorebird_code_push`, `flutter_local_notifications`

---

## 🗓️ جدول 5 أسابيع

### أسبوع 1: الأساس
- [] Google Stitch: تصميم كل الشاشات
- [ ] flutter create + A3 Bootstrap + Shorebird init
- [ ] G7 Theme + E1 Router + H1 DI + Firebase
- [ ] S01 Splash + S02 Onboarding + S04 Login + S05 Register

### أسبوع 2: Notes الأساسي
- [ ] Data layer (DTO, Entity, Repo) — C1-C4, D2-D3
- [ ] Notes Cubit — B1
- [ ] S06 Home + G8 Shimmer + G9 Slivers
- [ ] S07 Editor + S08 Detail + Auto-save

### أسبوع 3: Offline + Search
- [ ] C5 Offline-First + D6 Hive + Sync
- [ ] B2 Pagination + B4 Search + K3 Debouncer
- [ ] S11 Search + S15 Folders + S16 Tags + S17 Trash

### أسبوع 4: AI + OCR + Export
- [ ] S09 OCR + K1 Isolate + ML Kit
- [ ] Gemini AI + S10 Summary Sheet
- [ ] S12 PDF Export + C8 Upload + C10 Download
- [ ] Platform Channels

### أسبوع 5: Polish + Deploy
- [ ] A6 Localization + S13 Settings + S14 Profile
- [ ] Premium gating + C11 Mock + C12 Cache + K6 Preloader
- [ ] App icons + Store listing + Build + Deploy
