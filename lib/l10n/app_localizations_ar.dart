// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'نوتيفا';

  @override
  String get onboardingStep1Title => 'سجل أفكارك';

  @override
  String get onboardingStep1Description =>
      'دوّن أفكارك وملاحظاتك وتذكيراتك بسرعة في أي مكان وفي أي وقت.';

  @override
  String get onboardingStep2Title => 'نظم بسهولة';

  @override
  String get onboardingStep2Description =>
      'صنف ملاحظاتك حسب الفئات أو الوسوم للحفاظ على تنظيم كل شيء.';

  @override
  String get onboardingStep3Title => 'الوصول من أي مكان';

  @override
  String get onboardingStep3Description =>
      'ملاحظاتك متزامنة عبر جميع أجهزتك بسلاسة.';

  @override
  String get skip => 'تخطي';

  @override
  String get next => 'التالي';

  @override
  String get getStarted => 'ابدأ الآن';

  @override
  String get ok => 'حسناً';

  @override
  String get error => 'خطأ';

  @override
  String get information => 'تنبيه';

  @override
  String get serverError => 'حدث خطأ في الخادم. يرجى المحاولة لاحقاً.';

  @override
  String get networkError => 'لا يوجد اتصال بالإنترنت. يرجى التحقق من الشبكة.';

  @override
  String get invalidCredentials =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة.';

  @override
  String get emailAlreadyInUse => 'هذا البريد الإلكتروني مسجل بالفعل.';

  @override
  String get weakPassword => 'كلمة المرور ضعيفة جداً.';

  @override
  String get tooManyRequests => 'محاولات كثيرة جداً. يرجى المحاولة لاحقاً.';

  @override
  String get userDisabled => 'لقد تم تعطيل هذا الحساب.';

  @override
  String get operationNotAllowed => 'هذه العملية غير مسموح بها.';

  @override
  String get unknownError => 'حدث خطأ غير معروف في عملية المصادقة.';

  @override
  String get fieldRequired => 'هذا الحقل مطلوب';

  @override
  String get invalidEmail => 'صيغة البريد الإلكتروني غير صحيحة';

  @override
  String get passwordTooShort => 'يجب ألا تقل كلمة المرور عن 6 أحرف';

  @override
  String get welcomeBack => 'مرحباً بك مجدداً 👋';

  @override
  String get enterDetails => 'أدخل بياناتك للوصول إلى حسابك';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get signup => 'إنشاء حساب';

  @override
  String get register => 'سجل الآن';

  @override
  String get createAccount => 'إنشاء حساب جديد';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get resetPassword => 'إعادة تعيين كلمة المرور';

  @override
  String get sendResetLink => 'إرسال رابط استعادة كلمة المرور';

  @override
  String get passwordResetEmailSent =>
      'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني.';

  @override
  String get rememberPassword => 'تذكرت كلمة المرور؟';

  @override
  String get back => 'رجوع';

  @override
  String get signupDescription => 'أدخل بياناتك لإنشاء حساب جديد';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';

  @override
  String get authErrorTitle => 'خطأ في المصادقة';

  @override
  String get loginToContinue => 'سجل دخولك للمتابعة';

  @override
  String get success => 'نجاح';

  @override
  String get passwordResetInstruction =>
      'أدخل بريدك الإلكتروني المسجل لإرسال رابط إعادة تعيين كلمة المرور.';

  @override
  String get requiresRecentLogin =>
      'تتطلب هذه العملية تسجيلاً حديثاً للدخول. يرجى تسجيل الدخول مرة أخرى.';

  @override
  String get accountExistsWithDifferentCredential =>
      'هناك حساب مسجل بالفعل بنفس البريد الإلكتروني ولكن باستخدام وسيلة دخول مختلفة.';

  @override
  String get invalidActionCode => 'رمز الإجراء غير صالح أو منتهي الصلاحية.';

  @override
  String get authCancelled => 'تم إلغاء عملية المصادقة.';

  @override
  String get noArabicAllowed => 'غير مسموح باستعمال الحروف العربية';

  @override
  String get checkEmailAndSpam =>
      'يرجى التحقق من بريدك الإلكتروني لإعادة تعيين كلمة المرور. إذا لم تجدها، تأكد من فحص مجلد الرسائل المزعجة (Spam) أيضاً.';

  @override
  String get invalidEmailParts =>
      'يجب أن يتضمن البريد الإلكتروني \'@\' ونطاقاً (مثال: .com)';

  @override
  String get nameTooShort => 'يجب أن يكون الاسم 3 أحرف على الأقل';
}
