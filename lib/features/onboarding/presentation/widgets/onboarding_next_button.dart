import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:notiva/core/common/widgets/app_button.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';
import 'package:notiva/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:notiva/features/onboarding/presentation/cubit/onboarding_state.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    required this.pageController,
    required this.state,
    required this.cubit,
    super.key,
  });

  final PageController pageController;
  final OnboardingState state;
  final OnboardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Expanded(
      flex: 2,

      child:
          AppButton(
                onPressed: () {
                  if (state.isLastStep) {
                    unawaited(cubit.submit());
                  } else {
                    unawaited(
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                    );
                  }
                },
                isLoading: state is OnboardingLoading,
                text: state.isLastStep ? l10n.getStarted : l10n.next,
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.05, 1.05),
                duration: 1500.ms,
                curve: Curves.easeInOut,
              ),
    );
  }
}
