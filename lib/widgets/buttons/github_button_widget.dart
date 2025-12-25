import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:factlyapp_landing/constants/app_assets.dart';
import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/theme/text_styles.dart';
import 'package:factlyapp_landing/widgets/common/common_heart_hands_animated_icon_widget.dart';
import 'package:factlyapp_landing/widgets/animations/tap_hover_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web/web.dart' as web;

class GithubButton extends StatelessWidget {
  const GithubButton({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = context.isLightTheme
        ? Colors.transparent
        : context.lightPrimaryContainer;
    final borderColor = context.isLightTheme
        ? context.darkPrimaryContainer
        : Colors.white12;

    return TapHoverBuilder(
      onTap: _onTap,
      endScale: 0.94,
      builder: (isHovered) => Container(
        width: 164,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(42)),
          color: backgroundColor,
          border: Border.all(color: borderColor),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcherPlus.zoomIn(
                duration: const Duration(milliseconds: 150),
                child: isHovered
                    ? const CommonHeartHandsAnimatedIcon()
                    : SvgPicture.asset(AppAssets.github, width: 24),
              ),
              const SizedBox(width: 6),
              Text('GitHub', style: h5.copyWith(color: context.darkTextColor)),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap() {
    web.window.open(AppConstants.gitUrl, "_blank");
  }
}
