import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notiva/core/common/widgets/app_outlined_button.dart';
import 'package:notiva/core/utils/extensions/theme_helper_extension.dart';

class OnboardingBackButton extends StatelessWidget {
  const OnboardingBackButton({required this.pageController, super.key});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppOutlinedButton(
        onPressed: () {
          unawaited(
            pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          );
        },
        child: Icon(
          Icons.arrow_back_rounded,
          color: context.colors.mainColor,
        ),
      ),
    );
  }
}
