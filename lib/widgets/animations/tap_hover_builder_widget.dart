import 'package:factlyapp_landing/widgets/animations/tap_hover_animation_widget.dart';
import 'package:flutter/material.dart';

class TapHoverBuilder extends StatefulWidget {
  const TapHoverBuilder({
    super.key,
    required this.builder,
    this.endScale = TapHoverAnimation.defaultEndScale,
    this.onTap,
  });

  final Widget Function(bool) builder;
  final VoidCallback? onTap;
  final double endScale;

  @override
  State<TapHoverBuilder> createState() => _TapHoverBuilderState();
}

class _TapHoverBuilderState extends State<TapHoverBuilder> {
  late final isHovered = ValueNotifier<bool>(false);

  @override
  void dispose() {
    isHovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.translucent,
      child: MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        child: ValueListenableBuilder(
          valueListenable: isHovered,
          builder: (context, isHovered, _) {
            return AnimatedScale(
              duration: TapHoverAnimation.duration,
              curve: TapHoverAnimation.curve,
              scale: isHovered ? widget.endScale : 1.0,
              child: widget.builder(isHovered),
            );
          },
        ),
      ),
    );
  }
}
