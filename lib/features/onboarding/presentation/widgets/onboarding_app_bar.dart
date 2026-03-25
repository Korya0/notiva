import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/common/widgets/app_text_button.dart';
import 'package:notiva/core/router/app_routes.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';
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
          AppTextButton(
                onPressed: () => context.go(AppRoutes.login),
                text: context.l10n.skip,
              )
              .animate(delay: 200.ms)
              .fadeIn(duration: 00.ms, curve: Curves.easeOutCubic)
              .slide(
                begin: const Offset(0, 0.2),
                duration: 800.ms,
                curve: Curves.easeOutCubic,
              ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
