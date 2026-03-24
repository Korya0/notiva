import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/Common/animations/fade_in_slide_animation.dart';
import 'package:notiva/core/Extension/app_localizations_extension.dart';
import 'package:notiva/core/common/widgets/app_text_button.dart';
import 'package:notiva/core/router/app_routes.dart';
import 'package:notiva/features/onboarding/presentation/cubit/onboarding_state.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnboardingAppBar({required this.state, super.key});

  final OnboardingState state;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
      actions: [
        if (!state.isLastStep)
          FadeInSlideAnimation(
            beginOffset: const Offset(0.2, 0), // Slide from right
            child: AppTextButton(
              onPressed: () => context.go(AppRoutes.login),
              text: context.l10n.skip,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
