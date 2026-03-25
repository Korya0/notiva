import 'package:flutter/widgets.dart';
import 'package:notiva/core/constants/app_assets.dart';

class AssetPreloader {
  AssetPreloader._();
  static Future<void> preloadCriticalAssets(BuildContext context) async {
    await Future.wait([
      precacheImage(const AssetImage(AppAssets.logo), context),
      precacheImage(const AssetImage(AppAssets.onboardingCapture), context),
      precacheImage(const AssetImage(AppAssets.onboardingOrganize), context),
      precacheImage(const AssetImage(AppAssets.onboardingSync), context),
    ]);
  }
}
