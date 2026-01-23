import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/widgets/animations/bubbles_animation_widget.dart';
import 'package:flutter/material.dart';

class HomeDesktopBackgroundShape extends StatelessWidget {
  const HomeDesktopBackgroundShape({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const _Clipper(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppConstants.commonColoredGradient(context),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final smallCircleSize = Size.square(constraints.maxWidth * 0.6);
            final mediumCircleSize = Size.square(constraints.maxWidth * 1.2);

            return Stack(
              children: [
                const Positioned.fill(
                  child: BubblesAnimation(bubblesCount: 30, sizeFactor: 0.01),
                ),
                Positioned(
                  right: -smallCircleSize.width / 2,
                  bottom: -smallCircleSize.width / 2,
                  child: SizedBox.fromSize(
                    size: smallCircleSize,
                    child: const _DecorationCircle(),
                  ),
                ),
                Positioned(
                  right: -mediumCircleSize.width / 2,
                  bottom: -mediumCircleSize.width / 2,
                  child: SizedBox.fromSize(
                    size: mediumCircleSize,
                    child: const _DecorationCircle(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _DecorationCircle extends StatelessWidget {
  const _DecorationCircle();

  static const backgroundColor = Color(0x14FFFFFF);
  static const shadowColor = Color(0x14000000);

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurStyle: BlurStyle.outer,
            blurRadius: 15,
          ),
        ],
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
      ..moveTo(w * 0.2091000, h * -0.0021000)
      ..quadraticBezierTo(
        w * 0.2314417,
        h * 0.2517667,
        w * 0.3587333,
        h * 0.2640000,
      )
      ..cubicTo(
        w * 0.4821583,
        h * 0.2688000,
        w * 0.4704000,
        h * 0.4568500,
        w * 0.5982583,
        h * 0.4623333,
      )
      ..quadraticBezierTo(
        w * 0.8409750,
        h * 0.4728167,
        w * 0.8752917,
        h * 0.9998333,
      )
      ..lineTo(w * 1.0007750, h * 1.0014333)
      ..lineTo(w * 1.0000250, h * 0.0001500)
      ..lineTo(w * 0.2091000, h * -0.0021000)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
