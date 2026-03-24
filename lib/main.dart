import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/core/di/service_locator.dart';
import 'package:notiva/core/global_state/locale/app_locale_cubit.dart';
import 'package:notiva/core/global_state/theme/app_theme_cubit.dart';
import 'package:notiva/core/theme/system_ui_config.dart';
import 'package:notiva/notiva_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemUiConfig.setSplashMode();

  SystemUiConfig.setup();

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
      child: kIsWeb && !kReleaseMode
          ? DevicePreview(
              builder: (context) => const NotivaApp(),
            )
          : const NotivaApp(),
    ),
  );
}
