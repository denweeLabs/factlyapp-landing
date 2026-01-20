import 'dart:math';

import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/widgets/animations/bubbles_animation_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeMobileHeader extends StatelessWidget {
  const HomeMobileHeader({
    super.key,
    required this.constraints,
    required this.scrollFraction,
  });

  final BoxConstraints constraints;
  final ValueListenable<double> scrollFraction;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: scrollFraction,
      builder: (context, scrollFraction, child) {
        final heightFactor = max(0.2, 1.0 - scrollFraction);
        
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight * heightFactor,
          child: child!,
        );
      },
      child: ClipPath(
        clipper: const _Clipper(),
        child: Container(
          decoration: BoxDecoration(
            gradient: AppConstants.commonColoredGradient(context),
          ),
          child: Stack(
            children: [
              const Positioned.fill(
                child: BubblesAnimation(bubblesCount: 30, sizeFactor: 0.03),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Clipper extends CustomClipper<Path> {
  const _Clipper();

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;

    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, h * 0.3757750)
      ..quadraticBezierTo(
        w * 0.4861125,
        h * 0.3301667,
        w * 0.6860375,
        h * 0.4570500,
      )
      ..quadraticBezierTo(
        w * 0.8757625,
        h * 0.5833917,
        w * 1.0004125,
        h * 0.5839750,
      )
      ..lineTo(w, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
