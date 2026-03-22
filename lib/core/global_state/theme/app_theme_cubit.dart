import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notiva/core/global_state/global_local_data_source.dart';
import 'package:notiva/core/global_state/theme/app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit(this._localDataSource, {this.defaultTheme = ThemeMode.system})
    : super(const AppThemeInitial());
  final GlobalLocalDataSource _localDataSource;
  final ThemeMode defaultTheme;

  Future<void> loadTheme() async {
    emit(const AppThemeLoading());
    try {
      final theme = _localDataSource.getThemeMode() ?? defaultTheme;
      emit(AppThemeUpdated(theme));
    } on Exception catch (e) {
      emit(AppThemeFailure(e.toString()));
    }
  }

  Future<void> updateTheme(ThemeMode newTheme) async {
    try {
      await _localDataSource.saveThemeMode(newTheme);
      emit(AppThemeUpdated(newTheme));
    } on Exception catch (e) {
      emit(AppThemeFailure(e.toString()));
    }
  }
}
