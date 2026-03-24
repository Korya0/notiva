import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:notiva/features/onboarding/presentation/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({
    required int totalSteps,
    required this.onboardingLocalDataSource,
  }) : super(OnboardingInitial(currentStep: 0, totalSteps: totalSteps));

  final OnboardingLocalDataSource onboardingLocalDataSource;

  void nextStep() {
    if (state.isLastStep) return;
    emit(
      OnboardingInitial(
        currentStep: state.currentStep + 1,
        totalSteps: state.totalSteps,
      ),
    );
  }

  void previousStep() {
    if (state.isFirstStep) return;
    emit(
      OnboardingInitial(
        currentStep: state.currentStep - 1,
        totalSteps: state.totalSteps,
      ),
    );
  }

  Future<void> submit() async {
    emit(
      OnboardingLoading(
        currentStep: state.currentStep,
        totalSteps: state.totalSteps,
      ),
    );

    try {
      await onboardingLocalDataSource.setOnboardingCompleted();
      emit(
        OnboardingSuccess(
          currentStep: state.currentStep,
          totalSteps: state.totalSteps,
        ),
      );
    } on Exception catch (e) {
      emit(
        OnboardingFailure(
          currentStep: state.currentStep,
          totalSteps: state.totalSteps,
          error: e.toString(),
        ),
      );
    }
  }
}
