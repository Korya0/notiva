import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/di/service_locator.dart';
import 'package:notiva/core/router/app_routes.dart';
import 'package:notiva/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:notiva/features/onboarding/data/models/onboarding_model.dart';
import 'package:notiva/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:notiva/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:notiva/features/onboarding/presentation/widgets/onboarding_app_bar.dart';
import 'package:notiva/features/onboarding/presentation/widgets/onboarding_bottom_controls.dart';
import 'package:notiva/features/onboarding/presentation/widgets/onboarding_page_slider.dart';

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
    final steps = OnboardingData.getSteps(context);

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
            appBar: OnboardingAppBar(state: state),
            body: Column(
              children: [
                OnboardingPageSlider(
                  steps: steps,
                  pageController: _pageController,
                  state: state,
                  cubit: cubit,
                ),
                OnboardingBottomControls(
                  itemCount: steps.length,
                  currentIndex: state.currentStep,
                  pageController: _pageController,
                  state: state,
                  cubit: cubit,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
