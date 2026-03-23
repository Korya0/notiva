import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:notiva/core/di/service_locator.dart';
import 'package:notiva/core/global_state/locale/app_locale_cubit.dart';
import 'package:notiva/core/global_state/theme/app_theme_cubit.dart';
import 'package:notiva/core/theme/system_ui_config.dart';
import 'package:notiva/notiva_app.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  SystemUiConfig.setSplashMode();

  SystemUiConfig.setup();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await setupServiceLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final cubit = locator<AppThemeCubit>();
            unawaited(cubit.loadTheme());
            return cubit;
          },
        ),
        BlocProvider(
          create: (_) {
            final cubit = locator<AppLocaleCubit>();
            unawaited(cubit.loadLocale());
            return cubit;
          },
        ),
      ],
      child: const NotivaApp(),
    ),
  );
}
