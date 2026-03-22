
/*
import 'package:get_it/get_it.dart';

// 🧩 Pattern: H2 - DI Helper Class
// A generic helper to dramatically reduce boilerplate when registering standard Clean Architecture features.

class DIHelper {
  /// Registers a standard feature with Remote Source, Repository, UseCase, and Cubit.
  /// 
  /// Usage:
  /// ```dart
  /// DIHelper.registerFeature<AuthApi, AuthRepository, LoginUseCase, AuthCubit>(
  ///   locator: locator,
  ///   apiBuilder: (dio) => AuthApi(dio),
  ///   repoBuilder: (api) => AuthRepositoryImpl(api),
  ///   useCaseBuilder: (repo) => LoginUseCase(repo),
  ///   cubitBuilder: (useCase) => AuthCubit(useCase),
  /// );
  /// ```
  static void registerFeature<Api, Repo, UseCase, CubitType>({
    required GetIt locator,
    required Api Function(dynamic dio) apiBuilder,
    required Repo Function(Api api) repoBuilder,
    required UseCase Function(Repo repo) useCaseBuilder,
    required CubitType Function(UseCase useCase) cubitBuilder,
  }) {
    // 1. Register Data Source (API)
    // Requires a Dio instance to be registered globally first inside setup_core!
    if (!locator.isRegistered<Api>()) {
      locator.registerFactory<Api>(() => apiBuilder(locator<dynamic /* Dio */>()));
    }

    // 2. Register Repository (Interface -> Implementation)
    if (!locator.isRegistered<Repo>()) {
      locator.registerFactory<Repo>(() => repoBuilder(locator<Api>()));
    }

    // 3. Register Domain UseCase
    if (!locator.isRegistered<UseCase>()) {
      locator.registerFactory<UseCase>(() => useCaseBuilder(locator<Repo>()));
    }

    // 4. Register Presentation Cubit/Bloc
    // Cubits are ALWAYS factories to ensure a fresh state is created when the screen opens.
    if (!locator.isRegistered<CubitType>()) {
      locator.registerFactory<CubitType>(() => cubitBuilder(locator<UseCase>()));
    }
  }
}
*/