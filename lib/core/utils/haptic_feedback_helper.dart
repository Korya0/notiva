import 'package:flutter/services.dart';

/// 📳 HapticFeedbackHelper
/// Centralized utility to provide consistent tactile feedback across the app.
class HapticFeedbackHelper {
  const HapticFeedbackHelper._();

  /// Light impact for subtle interactions (e.g., character typing, successful validation)
  static Future<void> lightImpact() async {
    await HapticFeedback.lightImpact();
  }

  /// Medium impact for primary actions (e.g., button clicks, step transitions)
  static Future<void> mediumImpact() async {
    await HapticFeedback.mediumImpact();
  }

  /// Heavy impact for critical actions or errors
  static Future<void> heavyImpact() async {
    await HapticFeedback.heavyImpact();
  }

  /// Standard click feedback
  static Future<void> vaildClick() async {
    await HapticFeedback.vibrate();
  }

  /// Selection changed feedback
  static Future<void> selectionClick() async {
    await HapticFeedback.selectionClick();
  }
}
