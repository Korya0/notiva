import 'package:notiva/core/storage/app_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements AppStorage {
  SharedPreferencesStorage(this._prefs);
  final SharedPreferences _prefs;

  @override
  String? read(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<void> write(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  Future<void> delete(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    await _prefs.clear();
  }
}
