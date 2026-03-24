import 'package:flutter/material.dart';
import 'package:notiva/core/common/widgets/app_page_indicator.dart';
import 'package:notiva/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:notiva/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:notiva/features/onboarding/presentation/widgets/onboarding_back_button.dart';
import 'package:notiva/features/onboarding/presentation/widgets/onboarding_next_button.dart';

class OnboardingBottomControls extends StatelessWidget {
  const OnboardingBottomControls({
    required this.itemCount,
    required this.currentIndex,
    required this.pageController,
    required this.state,
    required this.cubit,
    super.key,
  });

  final int itemCount;
  final int currentIndex;
  final PageController pageController;
  final OnboardingState state;
  final OnboardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60, left: 32, right: 32),
      child: Column(
        children: [
          AppPageIndicator(
            itemCount: itemCount,
            currentIndex: currentIndex,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              if (!state.isFirstStep)
                OnboardingBackButton(pageController: pageController),
              if (!state.isFirstStep) const SizedBox(width: 16),
              OnboardingNextButton(
                pageController: pageController,
                state: state,
                cubit: cubit,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
