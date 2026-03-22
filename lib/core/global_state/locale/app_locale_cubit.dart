import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notiva/core/global_state/global_local_data_source.dart';
import 'package:notiva/core/global_state/locale/app_locale_state.dart';

class AppLocaleCubit extends Cubit<AppLocaleState> {
  AppLocaleCubit(
    this._localDataSource, {
    this.defaultLocale = const Locale('en'),
  }) : super(const AppLocaleInitial());
  final GlobalLocalDataSource _localDataSource;
  final Locale defaultLocale;

  Future<void> loadLocale() async {
    emit(const AppLocaleLoading());
    try {
      final locale = _localDataSource.getLocale() ?? defaultLocale;
      emit(AppLocaleUpdated(locale));
    } on Exception catch (e) {
      emit(AppLocaleFailure(e.toString()));
    }
  }

  Future<void> updateLocale(Locale newLocale) async {
    try {
      await _localDataSource.saveLocale(newLocale);
      emit(AppLocaleUpdated(newLocale));
    } on Exception catch (e) {
      emit(AppLocaleFailure(e.toString()));
    }
  }
}
