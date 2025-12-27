import 'package:easy_localization/easy_localization.dart';
import 'package:factlyapp_landing/constants/app_assets.dart';
import 'package:factlyapp_landing/localization/locale_keys.g.dart';
import 'package:factlyapp_landing/main.dart';
import 'package:factlyapp_landing/routes/router.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/theme/text_styles.dart';
import 'package:factlyapp_landing/utils.dart';
import 'package:factlyapp_landing/widgets/common/common_theme_toggle_icon_widget.dart';
import 'package:factlyapp_landing/widgets/animations/tap_hover_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter._({super.key, this.isMobile = false});

  const HomeFooter.desktop({Key? key}) : this._(key: key);
  const HomeFooter.mobile({Key? key}) : this._(key: key, isMobile: true);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final padding = isMobile
        ? const EdgeInsets.symmetric(horizontal: 32, vertical: 24)
        : const EdgeInsets.symmetric(horizontal: 32, vertical: 30);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.primaryContainer,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, -2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TapHoverAnimation(
                        onTap: () => context.go(Routes.privacy),
                        child: Padding(
                          padding: padding,
                          child: Text(
                            context.tr(LocaleKeys.label_privacy_policy),
                            style: h6.copyWith(color: context.textColorTernary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1.5,
                    height: 30,
                    color: context.textColor.withValues(alpha: 0.1),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TapHoverAnimation(
                        onTap: () => context.go(Routes.terms),
                        child: Padding(
                          padding: padding,
                          child: Text(
                            context.tr(LocaleKeys.label_terms_of_use),
                            style: h6.copyWith(color: context.textColorTernary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TapHoverAnimation(
              onTap: themeNotifier.toggleTheme,
              child: Padding(
                padding: padding.copyWith(right: 28),
                child: const CommonThemeToggleIcon(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TapHoverAnimation(
              onTap: launchSupportEmail,
              child: Padding(
                padding: padding.copyWith(right: 28),
                child: SvgPicture.asset(
                  AppAssets.messageQuestion,
                  width: 16,
                  colorFilter: ColorFilter.mode(
                    context.iconColorTernary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
