import 'dart:async';
import 'package:flutter/material.dart';

class FadeInSlideAnimation extends StatefulWidget {
  const FadeInSlideAnimation({
    required this.child,
    super.key,
    this.duration = const Duration(milliseconds: 800),
    this.delay = Duration.zero,
    this.beginOffset = const Offset(0, 0.2),
    this.curve = Curves.easeOutCubic,
  });

  final Widget child;
  final Duration duration;
  final Duration delay;
  final Offset beginOffset;
  final Curve curve;

  @override
  State<FadeInSlideAnimation> createState() => _FadeInSlideAnimationState();
}

class _FadeInSlideAnimationState extends State<FadeInSlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1, curve: widget.curve),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: widget.beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1, curve: widget.curve),
      ),
    );

    if (widget.delay == Duration.zero) {
      unawaited(_controller.forward());
    } else {
      unawaited(Future.delayed(widget.delay, () {
        if (mounted) unawaited(_controller.forward());
      }));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    
    // Adjust horizontal offset for RTL
    final effectiveSlideAnimation = isRtl && widget.beginOffset.dx != 0
        ? Tween<Offset>(
            begin: Offset(-widget.beginOffset.dx, widget.beginOffset.dy),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Interval(0, 1, curve: widget.curve),
            ),
          )
        : _slideAnimation;

    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: effectiveSlideAnimation,
        child: widget.child,
      ),
    );
  }
}
