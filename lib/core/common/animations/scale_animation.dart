import 'package:flutter/material.dart';

/// 🎨 Reusable Scale Animation based on TweenAnimationBuilder
class ScaleAnimation extends StatelessWidget {
  const ScaleAnimation({
    required this.child,
    super.key,
    this.duration = const Duration(milliseconds: 1000),
    this.begin = 0.9,
    this.end = 1.2,
    this.curve = Curves.easeOutCubic,
  });

  final Widget child;
  final Duration duration;
  final double begin;
  final double end;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      tween: Tween<double>(begin: begin, end: end),
      curve: curve,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }
}
