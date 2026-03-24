enum OnboardingStatus { initial, loading, success, failure }

sealed class OnboardingState {
  const OnboardingState({
    required this.currentStep,
    required this.totalSteps,
    this.error,
  });

  final int currentStep;
  final int totalSteps;
  final String? error;

  bool get isFirstStep => currentStep == 0;
  bool get isLastStep => currentStep == totalSteps - 1;
}

final class OnboardingInitial extends OnboardingState {
  const OnboardingInitial({
    required super.currentStep,
    required super.totalSteps,
  });
}

final class OnboardingLoading extends OnboardingState {
  const OnboardingLoading({
    required super.currentStep,
    required super.totalSteps,
  });
}

final class OnboardingSuccess extends OnboardingState {
  const OnboardingSuccess({
    required super.currentStep,
    required super.totalSteps,
  });
}

final class OnboardingFailure extends OnboardingState {
  const OnboardingFailure({
    required super.currentStep,
    required super.totalSteps,
    required String error,
  }) : super(error: error);
}
