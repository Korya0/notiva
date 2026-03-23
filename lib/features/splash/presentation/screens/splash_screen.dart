import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/common/animations/scale_animation.dart';
import 'package:notiva/core/common/widgets/asset_preloader.dart';
import 'package:notiva/core/constants/app_assets.dart';
import 'package:notiva/core/di/service_locator.dart';
import 'package:notiva/core/router/app_routes.dart';
import 'package:notiva/core/theme/app_text_styles.dart';
import 'package:notiva/core/theme/system_ui_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isInit = true;

  @override
  void initState() {
    super.initState();
    unawaited(_initializeApp());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      unawaited(AssetPreloader.preloadCriticalAssets(context));
      _isInit = false;
    }
  }

  @override
  void dispose() {
    SystemUiConfig.setAppMode();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    final brandingTimer = Future.wait([
      Future<void>.delayed(const Duration(seconds: 2000)),
      locator.allReady(),
    ]);

    FlutterNativeSplash.remove();

    const isAuthenticated = false;

    await brandingTimer;

    if (mounted) {
      SystemUiConfig.setAppMode();
      // let this be here for now
      // ignore: dead_code
      if (isAuthenticated) {
        context.go(AppRoutes.home);
      } else {
        context.go(AppRoutes.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleAnimation(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppAssets.logo,
                width: 50,
                errorBuilder: (context, error, stackTrace) {
                  return Text(
                    'N',
                    style: AppTextStyles.font70w400Secondary(
                      context,
                    ),
                  );
                },
              ),
              Text(
                'otiva',
                style: AppTextStyles.font70w400Secondary(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
