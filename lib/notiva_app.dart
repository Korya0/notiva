import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/core/Extension/app_localizations_extension.dart';
import 'package:notiva/core/common/widgets/keyboard_dismisser.dart';
import 'package:notiva/core/global_state/locale/app_locale_cubit.dart';
import 'package:notiva/core/global_state/locale/app_locale_state.dart';
import 'package:notiva/core/global_state/theme/app_theme_cubit.dart';
import 'package:notiva/core/global_state/theme/app_theme_state.dart';
import 'package:notiva/core/router/app_router.dart';
import 'package:notiva/core/theme/app_theme.dart';
import 'package:notiva/l10n/app_localizations.dart';

class NotivaApp extends StatelessWidget {
  const NotivaApp({
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

            return KeyboardDismisser(
              child: MaterialApp.router(
                onGenerateTitle: (context) => context.l10n.appTitle,
                debugShowCheckedModeBanner: false,
                routerConfig: appRouter,
                theme: AppTheme.lightTheme(locale),
                darkTheme: AppTheme.darkTheme(locale),
                themeMode: themeMode,
                locale: locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
              ),
            );
          },
        );
      },
    );
  }
}
