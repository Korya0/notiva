import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:notiva/core/utils/extensions/text_theme_extension.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    required this.title,
    this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 40),
      child: Column(
        children: [
          Text(
            title,
            style: context.textStyles.displayMedium,
            textAlign: TextAlign.center,
          ).animate().fade(duration: 400.ms).slideY(begin: -0.2, end: 0),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: context.textStyles.bodyMedium,
              textAlign: TextAlign.center,
            )
                .animate()
                .fade(delay: 100.ms, duration: 400.ms)
                .slideY(begin: -0.1, end: 0),
          ],
        ],
      ),
    );
  }
}
