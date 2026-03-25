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
  String get unknownError => 'An unknown error occurred during authentication.';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get invalidEmail => 'Invalid email format';

  @override
  String get passwordTooShort => 'Password must be at least 6 characters';

  @override
  String get welcomeBack => 'Welcome back 👋';

  @override
  String get enterDetails => 'Enter your details to access your account';

  @override
  String get email => 'Email Address';

  @override
  String get password => 'Password';

  @override
  String get login => 'Login';

  @override
  String get signup => 'Sign Up';

  @override
  String get register => 'Sign Up';

  @override
  String get createAccount => 'Create Account';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get sendResetLink => 'Send Reset Link';

  @override
  String get passwordResetEmailSent =>
      'A password reset link has been sent to your email.';

  @override
  String get rememberPassword => 'Remembered your password?';

  @override
  String get back => 'Back';

  @override
  String get signupDescription => 'Enter your information to sign up';

  @override
  String get fullName => 'Full Name';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get authErrorTitle => 'Authentication Error';

  @override
  String get loginToContinue => 'Login to your account to continue';

  @override
  String get success => 'Success';

  @override
  String get passwordResetInstruction =>
      'Enter your registered email below to receive a password reset link.';

  @override
  String get requiresRecentLogin =>
      'This operation requires a recent login. Please log in again.';

  @override
  String get accountExistsWithDifferentCredential =>
      'An account already exists with this email user a different sign-in method.';

  @override
  String get invalidActionCode => 'The action code is invalid or has expired.';

  @override
  String get authCancelled => 'Authentication was cancelled.';

  @override
  String get noArabicAllowed => 'Arabic characters are not allowed';

  @override
  String get checkEmailAndSpam =>
      'Please check your email to reset your password. If you don\'t see it, be sure to check your spam folder.';

  @override
  String get invalidEmailParts =>
      'Email must include \'@\' and a domain (e.g., .com)';

  @override
  String get nameTooShort => 'Name must be at least 3 characters';
}
