import 'package:get_it/get_it.dart';
import 'package:notiva/core/di/async_di_setup.dart';
import 'package:notiva/core/global_state/global_local_data_source.dart';
import 'package:notiva/core/global_state/locale/app_locale_cubit.dart';
import 'package:notiva/core/global_state/theme/app_theme_cubit.dart';
import 'package:notiva/core/storage/app_storage.dart';
import 'package:notiva/core/storage/shared_preferences_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  await initAsyncDependencies();

  _setupCore();

  _setupFeatures();
}

void _setupCore() {
  locator
    ..registerLazySingleton<AppStorage>(
      () => SharedPreferencesStorage(locator<SharedPreferences>()),
    )
    ..registerLazySingleton<GlobalLocalDataSource>(
      () => GlobalLocalDataSource(locator<AppStorage>()),
    )
    ..registerLazySingleton<AppThemeCubit>(
      () => AppThemeCubit(locator<GlobalLocalDataSource>()),
    )
    ..registerLazySingleton<AppLocaleCubit>(
      () => AppLocaleCubit(locator<GlobalLocalDataSource>()),
    );
}

void _setupFeatures() {}
