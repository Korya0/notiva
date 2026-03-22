import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class AppLocaleState extends Equatable {
  const AppLocaleState();

  @override
  List<Object?> get props => [];
}

final class AppLocaleInitial extends AppLocaleState {
  const AppLocaleInitial();
}

final class AppLocaleLoading extends AppLocaleState {
  const AppLocaleLoading();
}

final class AppLocaleUpdated extends AppLocaleState {
  const AppLocaleUpdated(this.locale);
  final Locale locale;

  @override
  List<Object?> get props => [locale];
}

final class AppLocaleFailure extends AppLocaleState {
  const AppLocaleFailure(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
