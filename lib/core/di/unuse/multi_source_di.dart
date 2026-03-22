/*
import 'package:get_it/get_it.dart';

// 🔌 Pattern: H3 - Multi-Source Feature DI
// Advanced registration for features requiring BOTH Remote (API) and Local (Database) sources.
// We cannot use the generic DIHelper for this, as it requires explicit manual wiring.

void setupCartDI() {
  final locator = GetIt.instance;

  // 1. Register Data Sources
  if (!locator.isRegistered<dynamic /* CartRemoteDataSource */>()) {
    locator.registerFactory<dynamic>(() => dynamic /* CartRemoteDataSource(locator<Dio>()) */);
  }
  
  if (!locator.isRegistered<dynamic /* CartLocalDataSource */>()) {
    locator.registerFactory<dynamic>(() => dynamic /* CartLocalDataSource(locator<HiveInterface>()) */);
  }

  // 2. Register Repository
  // Inject BOTH sources into the repository constructor.
  if (!locator.isRegistered<dynamic /* CartRepository */>()) {
    locator.registerFactory<dynamic>(
      () => dynamic /* CartRepositoryImpl(
        remoteSource: locator<CartRemoteDataSource>(),
        localSource: locator<CartLocalDataSource>(),
        networkInfo: locator<NetworkInfo>(), // Important for offline-first syncing
      ) */,
    );
  }

  // 3. Register UseCases
  if (!locator.isRegistered<dynamic /* SyncCartUseCase */>()) {
    locator.registerFactory<dynamic>(() => dynamic /* SyncCartUseCase(locator<CartRepository>()) */);
  }

  // 4. Register Multi-case Cubit
  if (!locator.isRegistered<dynamic /* CartCubit */>()) {
    locator.registerFactory<dynamic>(
      () => dynamic /* CartCubit(
        syncUseCase: locator<SyncCartUseCase>(),
        // other use cases...
      ) */,
    );
  }
}
*/
