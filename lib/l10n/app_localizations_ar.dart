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
}
