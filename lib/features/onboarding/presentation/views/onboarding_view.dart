import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/Extension/app_localizations_extension.dart';
import 'package:notiva/core/Extension/theme_helper_extension.dart';
import 'package:notiva/core/common/widgets/app_button.dart';
import 'package:notiva/core/common/widgets/app_outlined_button.dart';
import 'package:notiva/core/common/widgets/app_text_button.dart';
import 'package:notiva/core/constants/app_assets.dart';
import 'package:notiva/core/di/service_locator.dart';
import 'package:notiva/core/router/app_routes.dart';
import 'package:notiva/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:notiva/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:notiva/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:notiva/features/onboarding/presentation/widgets/onboarding_step_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;

    final steps = <OnboardingData>[
      OnboardingData(
        title: l10n.onboardingStep1Title,
        description: l10n.onboardingStep1Description,
        imagePath: AppAssets.onboardingCapture,
      ),
      OnboardingData(
        title: l10n.onboardingStep2Title,
        description: l10n.onboardingStep2Description,
        imagePath: AppAssets.onboardingOrganize,
      ),
      OnboardingData(
        title: l10n.onboardingStep3Title,
        description: l10n.onboardingStep3Description,
        imagePath: AppAssets.onboardingSync,
      ),
    ];

    return BlocProvider(
      create: (context) => OnboardingCubit(
        totalSteps: steps.length,
        onboardingLocalDataSource: locator<OnboardingLocalDataSource>(),
      ),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingSuccess) {
            context.go(AppRoutes.login);
          }
        },
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                if (!state.isLastStep)
                  AppTextButton(
                    onPressed: () => context.go(AppRoutes.login),
                    text: l10n.skip,
                  ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: steps.length,
                    onPageChanged: (index) {
                      if (index > state.currentStep) {
                        for (var i = state.currentStep; i < index; i++) {
                          cubit.nextStep();
                        }
                      } else if (index < state.currentStep) {
                        for (var i = state.currentStep; i > index; i--) {
                          cubit.previousStep();
                        }
                      }
                    },
                    itemBuilder: (context, index) {
                      final step = steps[index];
                      return OnboardingStepWidget(
                        title: step.title,
                        description: step.description,
                        imagePath: step.imagePath,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 60,
                    left: 32,
                    right: 32,
                  ),
                  child: Column(
                    children: [
                      // Custom Local Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          steps.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width: state.currentStep == index ? 24 : 8,
                            decoration: BoxDecoration(
                              color: state.currentStep == index
                                  ? colors.mainColor
                                  : colors.textSecondary?.withValues(
                                      alpha: 0.3,
                                    ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          if (!state.isFirstStep)
                            Expanded(
                              child: AppOutlinedButton(
                                onPressed: () {
                                  unawaited(
                                    _pageController.previousPage(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeInOut,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color: colors.mainColor,
                                ),
                              ),
                            ),
                          if (!state.isFirstStep) const SizedBox(width: 16),
                          Expanded(
                            flex: 2,
                            child: AppButton(
                              onPressed: () {
                                if (state.isLastStep) {
                                  unawaited(cubit.submit());
                                } else {
                                  unawaited(
                                    _pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeInOut,
                                    ),
                                  );
                                }
                              },
                              isLoading: state is OnboardingLoading,
                              text: state.isLastStep
                                  ? l10n.getStarted
                                  : l10n.next,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class OnboardingData {
  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
  final String title;
  final String description;
  final String imagePath;
}
