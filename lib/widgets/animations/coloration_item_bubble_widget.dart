import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/theme/app_theme_data.dart';
import 'package:factlyapp_landing/widgets/animations/tap_hover_animation_widget.dart';
import 'package:flutter/material.dart';

class ColorationItemBubble extends StatelessWidget {
  const ColorationItemBubble({
    super.key,
    required this.coloration,
    required this.isSelected,
    required this.onTap,
    required this.index,
    required this.size,
    this.offset = const Offset(0.0, 0.14),
  });

  final ThemeColoration coloration;
  final bool isSelected;
  final void Function(ThemeColoration) onTap;
  final double size;
  final Offset offset;
  final int index;

  @override
  Widget build(BuildContext context) {
    final scale = isSelected ? 1.12 : 0.96;
    final slide = isSelected ? Offset.zero : offset;

    final scaleCurve = isSelected
        ? const Interval(0.15, 1.0, curve: ElasticOutCurve(0.75))
        : const Interval(0.0, 0.6, curve: Curves.fastEaseInToSlowEaseOut);

    return Center(
      child: RepaintBoundary.wrap(
        TapHoverAnimation(
          onTap: () => onTap(coloration),
          child: AnimatedSlide(
            offset: slide,
            curve: Curves.fastEaseInToSlowEaseOut,
            duration: const Duration(milliseconds: 600),
            child: AnimatedScale(
              scale: scale,
              curve: scaleCurve,
              duration: const Duration(milliseconds: 800),
              child: SizedBox.square(
                dimension: size,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3.0),
                    gradient: AppConstants.commonColoredGradient(
                      context,
                      color1: coloration.primary,
                      color2: coloration.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        index,
      ),
    );
  }
}
