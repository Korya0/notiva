import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A reusable back button for use in app bars across the application.
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => context.pop(),
      icon: const Icon(Icons.arrow_back_ios_new, size: 20),
    );
  }
}
