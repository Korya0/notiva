import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/di/service_locator.dart';
import 'package:notiva/core/router/app_routes.dart';
import 'package:notiva/core/theme/app_colors.dart';
import 'package:notiva/core/theme/system_ui_config.dart';
import 'package:notiva/core/utils/initialization/asset_preloader.dart';
import 'package:notiva/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:notiva/features/splash/presentation/widgets/app_brand_logo.dart';

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
    final splashTimer = Future<void>.delayed(const Duration(seconds: 3));
    final brandingTimer = locator.allReady();

    await Future.wait([
      splashTimer,
      brandingTimer,
    ]);

    final isOnboardingCompleted = locator<OnboardingLocalDataSource>()
        .isOnboardingCompleted();
    const isAuthenticated = false;

    if (mounted) {
      SystemUiConfig.setAppMode();
      if (!isOnboardingCompleted) {
        context.go(AppRoutes.onboarding);
        //
        // ignore: dead_code
      } else if (isAuthenticated) {
        context.go(AppRoutes.home);
      } else {
        context.go(AppRoutes.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundLight,
      body: Center(
        child: const AppBrandLogo()
            .animate()
            .scale(duration: 1.seconds)
            .fadeIn(),
      ),
    );
  }
}
