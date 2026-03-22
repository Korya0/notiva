import 'package:flutter/material.dart';
import 'package:notiva/core/storage/app_storage.dart';
import 'package:notiva/core/storage/storage_keys.dart';

class GlobalLocalDataSource {
  GlobalLocalDataSource(this._storage);
  final AppStorage _storage;

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    await _storage.write(StorageKeys.themeMode, themeMode.name);
  }

  ThemeMode? getThemeMode() {
    final name = _storage.read(StorageKeys.themeMode);
    if (name == null) return null;
    return ThemeMode.values.firstWhere(
      (e) => e.name == name,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> saveLocale(Locale locale) async {
    await _storage.write(StorageKeys.localeCode, locale.languageCode);
  }

  Locale? getLocale() {
    final code = _storage.read(StorageKeys.localeCode);
    if (code == null) return null;
    return Locale(code);
  }
}
