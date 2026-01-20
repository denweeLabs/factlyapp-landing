import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/localization/locale_keys.g.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/theme/text_styles.dart';
import 'package:factlyapp_landing/widgets/common/common_seal_animated_icon_widget.dart';
import 'package:flutter/material.dart';

class CommonAppTitleSubtitle extends StatelessWidget {
  const CommonAppTitleSubtitle({
    super.key,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.subtitleAlign = TextAlign.start,
  });

  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign subtitleAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (crossAxisAlignment == CrossAxisAlignment.center)
              const SizedBox(width: 36),
            Text(
              context.tr(LocaleKeys.home_title),
              style: h0.copyWith(fontSize: 42, color: context.textColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 10),
            const CommonSealAnimatedIcon(),
          ],
        ).fadeInUp(
          curve: Curves.linearToEaseOut,
          duration: const Duration(milliseconds: 1200),
        ),
        const SizedBox(height: 8),
        Text(
          context.tr(LocaleKeys.home_subtitle),
          style: bodyL.copyWith(
            fontSize: 18,
            color: context.textColorSecondary,
            fontFamily: context.whenLanguage(
              en: () => AppConstants.primaryFont,
              ru: () => AppConstants.secondaryFont,
            ),
          ),
          textAlign: subtitleAlign,
        ).fadeInUp(
          curve: Curves.linearToEaseOut,
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 300),
        ),
      ],
    );
  }
}
