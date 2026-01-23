import 'package:easy_localization/easy_localization.dart';
import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/localization/locale_keys.g.dart';
import 'package:factlyapp_landing/routes/router.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/theme/text_styles.dart';
import 'package:factlyapp_landing/widgets/animations/tap_hover_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonTermsPrivacyLinks extends StatelessWidget {
  const CommonTermsPrivacyLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = context.textColor.withValues(alpha: 0.8);
    final decorationColor = context.textColorSecondary;
    final fontFamily = context.whenLanguage(
      en: () => AppConstants.primaryFont,
      ru: () => AppConstants.secondaryFont,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TapHoverAnimation(
          onTap: () => context.go(Routes.privacy),
          child: Text(
            context.tr(LocaleKeys.label_privacy_policy),
            style: bodyM.copyWith(
              color: textColor,
              decorationColor: decorationColor,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              fontFamily: fontFamily,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '•',
          style: bodyM.copyWith(color: textColor, fontWeight: FontWeight.w700),
        ),
        const SizedBox(width: 10),
        TapHoverAnimation(
          onTap: () => context.go(Routes.terms),
          child: Text(
            context.tr(LocaleKeys.label_terms_of_use),
            style: bodyM.copyWith(
              color: textColor,
              decorationColor: decorationColor,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              fontFamily: fontFamily,
            ),
          ),
        ),
      ],
    );
  }
}
