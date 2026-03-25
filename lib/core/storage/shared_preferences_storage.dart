import 'package:notiva/core/storage/app_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements AppStorage {
  SharedPreferencesStorage(this._prefs);
  final SharedPreferences _prefs;

  @override
  Future<void> write(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else {
      throw Exception('Type not supported by SharedPreferences');
    }
  }

  @override
  T? read<T>(String key) {
    return _prefs.get(key) as T?;
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
