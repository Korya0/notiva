import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension PlatformHelperExtension on BuildContext {
  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;
  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;
  bool get isWeb => kIsWeb;
}
