import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/core/di/service_locator.dart';
import 'package:notiva/core/global_state/locale/app_locale_cubit.dart';
import 'package:notiva/core/global_state/locale/app_locale_state.dart';
import 'package:notiva/core/global_state/theme/app_theme_cubit.dart';
import 'package:notiva/core/global_state/theme/app_theme_state.dart';
import 'package:notiva/core/router/app_router.dart';
import 'package:notiva/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        final themeMode = themeState is AppThemeUpdated
            ? themeState.themeMode
            : ThemeMode.system;

        return BlocBuilder<AppLocaleCubit, AppLocaleState>(
          builder: (context, localeState) {
            final locale = localeState is AppLocaleUpdated
                ? localeState.locale
                : const Locale('en');

            return MaterialApp.router(
              title: 'Notiva',
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter,

              themeMode: themeMode,
              locale: locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        );
      },
    );
  }
}
