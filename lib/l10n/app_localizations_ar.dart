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
  String get helloWorld => 'أهلاً بك!';

  @override
  String get success => 'تمت العملية بنجاح';

  @override
  String get error => 'حدث خطأ ما';

  @override
  String get loading => 'جاري التحميل...';
}
