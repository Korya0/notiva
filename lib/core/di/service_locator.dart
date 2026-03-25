import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notiva/core/di/async_di_setup.dart';
import 'package:notiva/core/global_state/global_local_data_source.dart';
import 'package:notiva/core/global_state/locale/app_locale_cubit.dart';
import 'package:notiva/core/global_state/theme/app_theme_cubit.dart';
import 'package:notiva/core/storage/app_storage.dart';
import 'package:notiva/core/storage/shared_preferences_storage.dart';
import 'package:notiva/core/utils/connectivity_service.dart';
import 'package:notiva/features/auth/data/repositories/firebase_auth_repository_impl.dart';
import 'package:notiva/features/auth/domain/repositories/auth_repository.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:notiva/features/auth/presentation/cubit/form/auth_form_cubit.dart';
import 'package:notiva/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  await initAsyncDependencies();

  _setupCore();

  _setupFeatures();
}

void _setupCore() {
  locator
    ..registerLazySingleton<ConnectivityService>(ConnectivityService.new)
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

void _setupFeatures() {
  // Auth
  locator
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerLazySingleton<GoogleSignIn>(
      () {
        final instance = GoogleSignIn.instance;

        const webId = String.fromEnvironment('GOOGLE_WEB_CLIENT_ID');
        const iosId = String.fromEnvironment('GOOGLE_IOS_CLIENT_ID');

        unawaited(
          instance.initialize(
            clientId: kIsWeb ? webId : iosId,
            serverClientId: kIsWeb ? null : webId,
          ),
        );
        return instance;
      },
    )
    ..registerLazySingleton<AuthRepository>(
      () => FirebaseAuthRepositoryImpl(
        firebaseAuth: locator<FirebaseAuth>(),
        googleSignIn: locator<GoogleSignIn>(),
        connectivityService: locator<ConnectivityService>(),
      ),
    )
    ..registerFactory<AuthCubit>(
      () => AuthCubit(locator<AuthRepository>()),
    )
    ..registerFactory<AuthFormCubit>(
      AuthFormCubit.new,
    )
    ..registerLazySingleton<OnboardingLocalDataSource>(
      () => OnboardingLocalDataSource(locator<AppStorage>()),
    );
}
