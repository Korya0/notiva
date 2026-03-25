import 'package:equatable/equatable.dart';

enum AuthFormStatus { initial, loading, success, failure }

final class AuthFormState extends Equatable {
  const AuthFormState({
    required this.currentStep,
    required this.totalSteps,
    this.formData = const {},
    this.errors = const {},
    this.status = AuthFormStatus.initial,
    this.errorMessage,
    this.isPasswordVisible = false,
  });

  final int currentStep;
  final int totalSteps;
  final Map<String, String> formData;
  final Map<String, String?> errors;
  final AuthFormStatus status;
  final String? errorMessage;
  final bool isPasswordVisible;

  bool get isFirstStep => currentStep == 0;
  bool get isLastStep => currentStep == totalSteps - 1;
  bool get isValid =>
      errors.values.every((e) => e == null) && formData.isNotEmpty;

  AuthFormState copyWith({
    int? currentStep,
    Map<String, String>? formData,
    Map<String, String?>? errors,
    AuthFormStatus? status,
    String? errorMessage,
    bool? isPasswordVisible,
  }) {
    return AuthFormState(
      currentStep: currentStep ?? this.currentStep,
      totalSteps: totalSteps,
      formData: formData ?? this.formData,
      errors: errors ?? this.errors,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [
    currentStep,
    totalSteps,
    formData,
    errors,
    status,
    errorMessage,
    isPasswordVisible,
  ];
}
