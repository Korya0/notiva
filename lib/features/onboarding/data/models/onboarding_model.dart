import 'package:flutter/material.dart';
import 'package:notiva/core/Extension/app_localizations_extension.dart';
import 'package:notiva/core/constants/app_assets.dart';

class OnboardingData {
  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  final String title;
  final String description;
  final String imagePath;

  static List<OnboardingData> getSteps(BuildContext context) {
    final l10n = context.l10n;
    return [
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
  }
}
