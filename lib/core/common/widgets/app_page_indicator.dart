import 'package:flutter/material.dart';
import 'package:notiva/core/Extension/theme_helper_extension.dart';

class AppPageIndicator extends StatelessWidget {
  const AppPageIndicator({
    required this.itemCount,
    required this.currentIndex,
    super.key,
  });

  final int itemCount;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: currentIndex == index ? 24 : 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? colors.mainColor
                : colors.textSecondary?.withValues(
                    alpha: 0.3,
                  ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
