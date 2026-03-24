import 'dart:async';
import 'package:flutter/material.dart';

class PulseAnimation extends StatefulWidget {
  const PulseAnimation({
    required this.child,
    super.key,
    this.duration = const Duration(milliseconds: 1500),
    this.scaleBegin = 1.0,
    this.scaleEnd = 1.05,
    this.curve = Curves.easeInOut,
  });

  final Widget child;
  final Duration duration;
  final double scaleBegin;
  final double scaleEnd;
  final Curve curve;

  @override
  State<PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    unawaited(_controller.repeat(reverse: true));

    _scaleAnimation = Tween<double>(
      begin: widget.scaleBegin,
      end: widget.scaleEnd,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}
