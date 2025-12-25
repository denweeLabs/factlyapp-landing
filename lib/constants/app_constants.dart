import 'package:flutter/material.dart';

abstract class AppConstants {
  static const primaryFont = 'Manrope';
  static const secondaryFont = 'Quicksand';

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
  static const googlePlayUrl = 'https://play.google.com/store/apps/details?id=app.denwee.factlyapp';
  static const gitUrl = 'https://github.com/denweeLabs/factlyapp';
  static const supportEmail = 'support@denwee.com';
  static const supportSubject = 'Support Request :)';

  static const lightElasticOut = ElasticOutCurve(0.85);
}
