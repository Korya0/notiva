import 'package:notiva/core/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initAsyncDependencies() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
}
