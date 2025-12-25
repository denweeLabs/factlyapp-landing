import 'package:animate_do/animate_do.dart';
import 'package:factlyapp_landing/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonSealAnimatedIcon extends StatefulWidget {
  const CommonSealAnimatedIcon({super.key});

  @override
  State<CommonSealAnimatedIcon> createState() => _CommonSealAnimatedIconState();
}

class _CommonSealAnimatedIconState extends State<CommonSealAnimatedIcon>
    with SingleTickerProviderStateMixin {
  static const duration = Duration(milliseconds: 8000);

  late final controller = AnimationController(vsync: this, duration: duration);
  late final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0.05, 0.5, curve: Curves.ease),
    ),
  );

  @override
  void initState() {
    super.initState();
    animate();
  }

  void animate() async {
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppAssets.seal,
      controller: animation,
      width: 30,
      height: 30,
    ).shakeY(
      from: 2,
      infinite: true,
      curve: Curves.easeInOutCirc,
      duration: duration,
    );
  }
}
