// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Notiva';

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get success => 'Operation successful';

  @override
  String get error => 'An error occurred';

  @override
  String get loading => 'Loading...';
}
