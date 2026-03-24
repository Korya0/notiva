import 'package:flutter/material.dart';
import 'package:notiva/features/onboarding/data/models/onboarding_model.dart';
import 'package:notiva/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:notiva/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:notiva/features/onboarding/presentation/widgets/onboarding_step_widget.dart';

class OnboardingPageSlider extends StatelessWidget {
  const OnboardingPageSlider({
    required this.steps,
    required this.pageController,
    required this.state,
    required this.cubit,
    super.key,
  });

  final List<OnboardingData> steps;
  final PageController pageController;
  final OnboardingState state;
  final OnboardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: steps.length,
        onPageChanged: _handlePageChange,
        itemBuilder: (context, index) {
          final step = steps[index];
          return OnboardingStepWidget(
            title: step.title,
            description: step.description,
            imagePath: step.imagePath,
          );
        },
      ),
    );
  }

  void _handlePageChange(int index) {
    if (index > state.currentStep) {
      for (var i = state.currentStep; i < index; i++) {
        cubit.nextStep();
      }
    } else if (index < state.currentStep) {
      for (var i = state.currentStep; i > index; i--) {
        cubit.previousStep();
      }
    }
  }
}
