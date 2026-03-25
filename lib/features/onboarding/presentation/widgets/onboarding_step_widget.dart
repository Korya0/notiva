import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:notiva/core/utils/extensions/text_theme_extension.dart';
import 'package:notiva/core/utils/extensions/theme_helper_extension.dart';

class OnboardingStepWidget extends StatelessWidget {
  const OnboardingStepWidget({
    required this.title,
    required this.description,
    required this.imagePath,
    super.key,
  });

  final String title;
  final String description;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),

          // Image Container
          Image.asset(
                imagePath,
                height: MediaQuery.sizeOf(context).height * 0.35,
                fit: BoxFit.contain,
              )
              .animate(delay: 200.ms)
              .fadeIn(duration: 00.ms, curve: Curves.easeOutCubic)
              .slide(
                begin: const Offset(0, 0.2),
                duration: 800.ms,
                curve: Curves.easeOutCubic,
              ),

          const Spacer(),
          // Title
          Text(
                title,
                textAlign: TextAlign.center,
                style: context.textStyles.headlineLarge!.copyWith(
                  color: context.colors.textPrimary,
                ),
              )
              .animate(delay: 200.ms)
              .fadeIn(duration: 00.ms, curve: Curves.easeOutCubic)
              .slide(
                begin: const Offset(0, 0.2),
                duration: 800.ms,
                curve: Curves.easeOutCubic,
              ),

          const SizedBox(height: 16),
          // Description
          Text(
                description,
                textAlign: TextAlign.center,
                style: context.textStyles.bodyMedium!.copyWith(
                  color: context.colors.textSecondary,
                ),
              )
              .animate(delay: 200.ms)
              .fadeIn(duration: 00.ms, curve: Curves.easeOutCubic)
              .slide(
                begin: const Offset(0, 0.2),
                duration: 800.ms,
                curve: Curves.easeOutCubic,
              ),

          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
