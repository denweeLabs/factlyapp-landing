import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/theme/app_theme_data.dart';
import 'package:flutter/material.dart';

abstract class AppConstants {
  static const primaryFont = 'Quicksand';
  static const secondaryFont = 'Manrope';

  static const languageKeyName = 'lang';
  static const supportedLocales = [
    Locale('en'),
    Locale('it'),
    Locale('de'),
    Locale('fr'),
    Locale('ru'),
    Locale('zh'),
  ];
  static const fallbackLocale = Locale('en');
  static const localesPath = 'assets/translations';

  static const appStoreUrl = 'https://apps.apple.com/app/denwee/id6756196669';
  static const googlePlayUrl =
      'https://play.google.com/store/apps/details?id=app.denwee.factlyapp';
  static const gitUrl = 'https://github.com/denweeLabs/factlyapp';
  static const supportEmail = 'support@denwee.com';
  static const supportSubject = 'Support Request :)';

  static const lightElasticOut = ElasticOutCurve(0.85);

  static final defaultThemeColorationId = 8;

  /// Available coloration presets for theme customization
  static final themeColorations = <ThemeColoration>[
    ThemeColoration(
      id: 1,
      primary: const Color(0xFF5F4BAE),
      secondary: const Color(0xFF8570D1),
    ),
    ThemeColoration(
      id: 2,
      primary: const Color(0xFFF76276),
      secondary: const Color(0xFFFF8F87),
    ),
    ThemeColoration(
      id: 3,
      primary: const Color(0xFF267280),
      secondary: const Color(0xFF6CC6BA),
    ),
    ThemeColoration(
      id: 4,
      primary: const Color(0xFF447CF5),
      secondary: const Color(0xFF83A9F1),
    ),
    ThemeColoration(
      id: 5,
      primary: const Color(0xFFFBA17A),
      secondary: const Color(0xFFFD9697),
    ),
    ThemeColoration(
      id: 6,
      primary: const Color(0xFF08A5CC),
      secondary: const Color(0xFF03CBA6),
    ),
    ThemeColoration(
      id: 7,
      primary: const Color(0xFFF4AAC4),
      secondary: const Color(0xFFEE8AB8),
    ),
    ThemeColoration(
      id: 8,
      primary: const Color(0xFF635CE5),
      secondary: const Color(0xFF667ED2),
    ),
    ThemeColoration(
      id: 9,
      primary: const Color(0xFFFA6B6B),
      secondary: const Color(0xFFFF9980),
    ),
  ];

  static LinearGradient commonColoredGradient(
    BuildContext context, {
    Color? color1,
    Color? color2,
  }) => LinearGradient(
    colors: [
      color1 ?? context.theme.colorScheme.primary,
      color2 ?? context.theme.colorScheme.secondary,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
