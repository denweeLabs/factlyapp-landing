import 'package:factlyapp_landing/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonHeartHandsAnimatedIcon extends StatelessWidget {
  const CommonHeartHandsAnimatedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(AppAssets.heartHands, width: 24, height: 24);
  }
}
