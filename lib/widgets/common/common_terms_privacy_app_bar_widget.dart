import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/main.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/theme/text_styles.dart';
import 'package:factlyapp_landing/widgets/animations/tap_hover_animation_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_theme_toggle_icon_widget.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppConstants.commonColoredGradient(context),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 2.0),
            blurRadius: 12.0,
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 32),
      child: Row(
        children: [
          Text(
            title,
            style: h1.copyWith(
              color: context.lightTextColor,
              fontWeight: FontWeight.w800,
              fontFamily: context.whenLanguage(
                en: () => AppConstants.primaryFont,
                ru: () => AppConstants.secondaryFont,
              ),
            ),
          ),
          const Spacer(),
          TapHoverAnimation(
            onTap: themeNotifier.toggleThemeMode,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
              child: CommonThemeToggleIcon(
                size: 20,
                iconColor: context.lightIconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
