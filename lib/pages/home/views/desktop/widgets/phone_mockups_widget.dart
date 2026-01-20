import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:factlyapp_landing/constants/app_assets.dart';
import 'package:flutter/material.dart';

class HomeDesktopPhoneMockups extends StatelessWidget {
  const HomeDesktopPhoneMockups({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = context.locale.languageCode.toLowerCase();

    return _Mockup(imagePath: AppAssets.dualPhone(languageCode)).fadeInLeft(
      curve: Curves.linearToEaseOut,
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1200),
    );
  }
}

class _Mockup extends StatelessWidget {
  const _Mockup({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
