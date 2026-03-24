import 'package:flutter/material.dart';
import 'package:notiva/core/Extension/theme_helper_extension.dart';
import 'package:notiva/core/theme/app_text_styles.dart';

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
          ),
          const Spacer(),
          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.font24W700Secondary(context).copyWith(
              color: context.colors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyles.font16W400textSecondary(context).copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
