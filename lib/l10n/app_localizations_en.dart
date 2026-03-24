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
  String get onboardingStep1Title => 'Capture Your Thoughts';

  @override
  String get onboardingStep1Description =>
      'Quickly jot down ideas, notes, and reminders anywhere, anytime.';

  @override
  String get onboardingStep2Title => 'Organize with Ease';

  @override
  String get onboardingStep2Description =>
      'Group your notes by categories or tags to keep everything structured.';

  @override
  String get onboardingStep3Title => 'Access Everywhere';

  @override
  String get onboardingStep3Description =>
      'Your notes are synced across all your devices seamlessly.';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get getStarted => 'Get Started';

  @override
  String get ok => 'OK';

  @override
  String get error => 'Error';

  @override
  String get information => 'Information';

  @override
  String get serverError => 'A server error occurred. Please try again later.';

  @override
  String get networkError =>
      'No internet connection. Please check your network.';

  @override
  String get invalidCredentials => 'Invalid email or password.';

  @override
  String get emailAlreadyInUse => 'This email is already registered.';

  @override
  String get weakPassword => 'The password is too weak.';

  @override
  String get tooManyRequests => 'Too many attempts. Please try again later.';

  @override
  String get userDisabled => 'This account has been disabled.';

  @override
  String get operationNotAllowed => 'This operation is not allowed.';

  @override
  String get unknownError => 'An unknown authentication error occurred.';
}
