import 'package:animate_do/animate_do.dart';
import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/main.dart';
import 'package:factlyapp_landing/widgets/animations/coloration_overview_selector_widget.dart';
import 'package:factlyapp_landing/widgets/animations/tap_hover_animation_widget.dart';
import 'package:factlyapp_landing/widgets/buttons/apple_store_button_widget.dart';
import 'package:factlyapp_landing/widgets/buttons/github_button_widget.dart';
import 'package:factlyapp_landing/widgets/buttons/google_play_button_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_app_title_subtitle_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_terms_privacy_links_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_theme_toggle_icon_widget.dart';
import 'package:flutter/material.dart';

class HomeDesktopSideContent extends StatelessWidget {
  const HomeDesktopSideContent({
    super.key,
    required this.isTablet,
    required this.hPadding,
  });

  final bool isTablet;
  final double hPadding;

  static const colorPickerSize = Size(230, 82);
  static const vPadding = 54.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: hPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: colorPickerSize.height / 1.5),
          const Spacer(),
          const CommonAppTitleSubtitle(),
          const SizedBox(height: 42),
          Wrap(
            spacing: 10,
            runSpacing: 14,
            alignment: WrapAlignment.start,
            children: [
              const AppleStoreButton().fadeInUp(
                curve: AppConstants.lightElasticOut,
                duration: const Duration(milliseconds: 1800),
                delay: const Duration(milliseconds: 600),
              ),
              const GooglePlayButton().fadeInUp(
                curve: AppConstants.lightElasticOut,
                duration: const Duration(milliseconds: 1800),
                delay: const Duration(milliseconds: 800),
              ),
              const GithubButton().fadeInUp(
                curve: AppConstants.lightElasticOut,
                duration: const Duration(milliseconds: 1800),
                delay: const Duration(milliseconds: 1000),
              ),
            ],
          ),
          const SizedBox(height: vPadding),
          const Spacer(),
          _buildFooter(context).fadeIn(
            curve: Curves.linearToEaseOut,
            delay: const Duration(milliseconds: 2000),
            duration: const Duration(milliseconds: 1200),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      children: [
        SizedBox.fromSize(
          size: colorPickerSize,
          child: Stack(
            children: [
              ColorationOverviewSelector(
                bubbleSize: colorPickerSize.height / 1.7,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        TapHoverAnimation(
          onTap: themeNotifier.toggleThemeMode,
          child: SizedBox.square(
            dimension: colorPickerSize.height / 1.75,
            child: const CommonThemeToggleIcon(size: 18),
          ),
        ),
        const SizedBox(width: 12),
        AnimatedOpacity(
          opacity: isTablet ? 0.0 : 1.0,
          curve: Curves.linearToEaseOut,
          duration: const Duration(milliseconds: 600),
          child: const CommonTermsPrivacyLinks(),
        ),
      ],
    );
  }
}
