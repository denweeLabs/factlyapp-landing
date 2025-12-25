import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TapHoverAnimation extends StatefulWidget {
  const TapHoverAnimation({
    super.key,
    this.onTap,
    this.child,
    this.minOpacity = 0.7,
    this.endScale = defaultEndScale,
  });

  final VoidCallback? onTap;
  final double minOpacity;
  final double endScale;
  final Widget? child;

  static const duration = Duration(milliseconds: 110);
  static const curve = Curves.easeOutSine;
  static const defaultEndScale = 1.04;

  @override
  State<TapHoverAnimation> createState() => _TapHoverAnimationState();
}

class _TapHoverAnimationState extends State<TapHoverAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> scale;
  late final Animation<double> opacity;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: TapHoverAnimation.duration,
    );
    scale = Tween<double>(begin: 1.0, end: widget.endScale).animate(
      CurvedAnimation(
        parent: controller,
        curve: TapHoverAnimation.curve,
        reverseCurve: TapHoverAnimation.curve,
      ),
    );
    opacity = Tween<double>(begin: 1.0, end: widget.minOpacity).animate(
      CurvedAnimation(
        parent: controller,
        curve: TapHoverAnimation.curve,
        reverseCurve: TapHoverAnimation.curve,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.translucent,
      child: MouseRegion(
        onExit: (_) => controller.reverse(),
        onHover: (_) => controller.forward(),
        child: ScaleTransition(
          scale: scale,
          child: FadeTransition(opacity: opacity, child: widget.child),
        ),
      ),
    );
  }
}
