import 'package:flutter/widgets.dart';
import 'package:notiva/core/constants/app_assets.dart';

class AssetPreloader {
  AssetPreloader._();

  static Future<void> preloadCriticalAssets(BuildContext context) async {
    await precacheImage(
      const AssetImage(AppAssets.logo),
      context,
    );
  }
}
