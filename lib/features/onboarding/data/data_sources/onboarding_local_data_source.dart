import 'package:notiva/core/storage/app_storage.dart';
import 'package:notiva/core/storage/storage_keys.dart';

class OnboardingLocalDataSource {
  OnboardingLocalDataSource(this.appStorage);

  final AppStorage appStorage;

  Future<void> setOnboardingCompleted() async {
    await appStorage.write(StorageKeys.isOnboardingCompleted, true);
  }

  bool isOnboardingCompleted() {
    return appStorage.read<bool>(StorageKeys.isOnboardingCompleted) ?? false;
  }
}
