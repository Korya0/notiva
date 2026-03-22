import 'package:get_it/get_it.dart';
import 'package:notiva/core/di/async_di_setup.dart';

final GetIt locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  _setupCore();

  await initAsyncDependencies();

  _setupFeatures();
}

void _setupCore() {}

void _setupFeatures() {}
