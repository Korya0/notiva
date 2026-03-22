import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class AppThemeState extends Equatable {
  const AppThemeState();

  @override
  List<Object?> get props => [];
}

final class AppThemeInitial extends AppThemeState {
  const AppThemeInitial();
}

final class AppThemeLoading extends AppThemeState {
  const AppThemeLoading();
}

final class AppThemeUpdated extends AppThemeState {
  const AppThemeUpdated(this.themeMode);
  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];
}

final class AppThemeFailure extends AppThemeState {
  const AppThemeFailure(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
