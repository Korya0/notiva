import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:notiva/core/global_state/global_local_data_source.dart';
import 'package:notiva/core/global_state/locale/app_locale_cubit.dart';
import 'package:notiva/core/global_state/theme/app_theme_cubit.dart';
import 'package:notiva/core/services/connectivity_service.dart';
import 'package:notiva/core/storage/app_storage.dart';
import 'package:notiva/core/storage/shared_preferences_storage.dart';
import 'package:notiva/features/auth/data/repositories/firebase_auth_repository_impl.dart';
import 'package:notiva/features/auth/domain/repositories/auth_repository.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:notiva/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPrefs);

  _setupCore();
  _setupFeatures();
}

void _setupCore() {
  locator
    // Services
    ..registerLazySingleton<ConnectivityService>(ConnectivityService.new)
    ..registerLazySingleton<AppStorage>(
      () => SharedPreferencesStorage(locator()),
    )
    ..registerLazySingleton<GlobalLocalDataSource>(
      () => GlobalLocalDataSource(locator()),
    )
    // Global State
    ..registerLazySingleton<AppThemeCubit>(
      () => AppThemeCubit(locator()),
    )
    ..registerLazySingleton<AppLocaleCubit>(
      () => AppLocaleCubit(locator()),
    );
}

void _setupFeatures() {
  locator
    // Auth Feature
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerLazySingleton<AuthRepository>(
      () => FirebaseAuthRepositoryImpl(
        firebaseAuth: locator(),
        connectivityService: locator(),
      ),
    )
    ..registerFactory<AuthCubit>(() => AuthCubit(locator()))
    // Onboarding Feature
    ..registerLazySingleton<OnboardingLocalDataSource>(
      () => OnboardingLocalDataSource(locator()),
    );
}
