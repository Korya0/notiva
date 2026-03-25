import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/features/auth/presentation/cubit/form/auth_form_state.dart';

class AuthFormCubit extends Cubit<AuthFormState> {
  AuthFormCubit({int totalSteps = 2})
    : super(AuthFormState(currentStep: 0, totalSteps: totalSteps));

  /// B3: Update field value and trigger validation
  void onFieldChanged(String field, String value) {
    final updatedData = Map<String, String>.from(state.formData)
      ..[field] = value;
    final updatedErrors = Map<String, String?>.from(state.errors)
      ..[field] = _validate(field, value);

    emit(
      state.copyWith(
        formData: updatedData,
        errors: updatedErrors,
        status: AuthFormStatus.initial,
      ),
    );
  }

  /// B8: Alternative update for multiple fields
  void updateData(Map<String, String> newData) {
    final updatedData = Map<String, String>.from(state.formData)
      ..addAll(newData);
    final updatedErrors = Map<String, String?>.from(state.errors);

    for (final key in newData.keys) {
      updatedErrors[key] = _validate(key, newData[key] ?? '');
    }

    emit(
      state.copyWith(
        formData: updatedData,
        errors: updatedErrors,
      ),
    );
  }

  /// B8: Navigation
  void nextStep() {
    if (state.isLastStep) return;
    emit(state.copyWith(currentStep: state.currentStep + 1));
  }

  void previousStep() {
    if (state.isFirstStep) return;
    emit(state.copyWith(currentStep: state.currentStep - 1));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  /// B3: Validation Logic
  String? _validate(String field, String value) {
    if (value.isEmpty) return 'fieldRequired';

    if (field == 'email') {
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(value)) return 'invalidEmail';
    }

    if (field == 'password') {
      if (value.length < 6) return 'passwordTooShort';
    }

    return null;
  }

  void validateAll() {
    final updatedErrors = Map<String, String?>.from(state.errors);
    final fields = ['email', 'password'];
    for (final field in fields) {
      updatedErrors[field] = _validate(field, state.formData[field] ?? '');
    }
    emit(state.copyWith(errors: updatedErrors));
  }

  bool validateEmailOnly() {
    final email = state.formData['email'] ?? '';
    final error = _validate('email', email);
    final updatedErrors = Map<String, String?>.from(state.errors)
      ..['email'] = error;
    emit(state.copyWith(errors: updatedErrors));
    return error == null && email.isNotEmpty;
  }
}
