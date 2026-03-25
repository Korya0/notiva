import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:notiva/core/utils/extensions/theme_helper_extension.dart';

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
        (index) {
          final isActive = currentIndex == index;

          return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: isActive ? 24 : 8,
                decoration: BoxDecoration(
                  color: isActive
                      ? colors.mainColor
                      : colors.textSecondary.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              )
              .animate(target: isActive ? 1 : 0)
              .shimmer(
                duration: 1200.ms,
                color: Colors.white24,
              )
              .scaleXY(begin: 0.8, end: 1);
        },
      ),
    );
  }
}
