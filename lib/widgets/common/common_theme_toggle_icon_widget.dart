import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:factlyapp_landing/constants/app_assets.dart';
import 'package:factlyapp_landing/main.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonThemeToggleIcon extends StatelessWidget {
  const CommonThemeToggleIcon({super.key, this.size = 16});

  final double size;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        final iconPath = themeMode == ThemeMode.dark
            ? AppAssets.moon
            : AppAssets.sun;

        return AnimatedSwitcherPlus.flipY(
          duration: const Duration(milliseconds: 400),
          switchInCurve: Curves.easeInOutSine,
          switchOutCurve: Curves.easeInOutSine,
          child: SvgPicture.asset(
            iconPath,
            width: size,
            key: ValueKey(iconPath),
            colorFilter: ColorFilter.mode(
              context.iconColorTernary,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
