import 'package:easy_localization/easy_localization.dart';
import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:flutter/material.dart';

extension TextStylesX on BuildContext {
  T whenLanguage<T>({
    required T Function() en,
    T Function()? ru,
    T Function()? it,
    T Function()? fr,
    T Function()? de,
    T Function()? zh,
  }) {
    switch (locale.languageCode) {
      case 'en': return en();
      case 'ru': return ru?.call() ?? en();
      case 'it': return it?.call() ?? en();
      case 'fr': return fr?.call() ?? en();
      case 'de': return de?.call() ?? en();
      case 'zh': return zh?.call() ?? en();
      default: return en();
    }
  }
}

TextStyle _styleWrapper({
  double? height,
  double? fontSize,
  double? letterSpacing,
  FontWeight? fontWeight,
  String? fontFamily,
}) => TextStyle(
  height: height,
  fontSize: fontSize,
  letterSpacing: letterSpacing,
  fontWeight: fontWeight,
  fontFamily: fontFamily,
);

TextStyle get h0 {
  return _styleWrapper(
    fontSize: 32,
    letterSpacing: -0.3,
    fontFamily: AppConstants.primaryFont,
    fontWeight: FontWeight.w800,
  );
}

TextStyle get h1 {
  return _styleWrapper(
    fontSize: 24,
    letterSpacing: -0.2,
    fontFamily: AppConstants.primaryFont,
    fontWeight: FontWeight.w700,
  );
}

TextStyle get h2 {
  return _styleWrapper(
    fontSize: 22,
    letterSpacing: -0.6,
    fontFamily: AppConstants.primaryFont,
    fontWeight: FontWeight.w700,
  );
}

TextStyle get h3 {
  return _styleWrapper(
    fontSize: 20,
    letterSpacing: -0.2,
    fontFamily: AppConstants.primaryFont,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get h4 {
  return _styleWrapper(
    fontSize: 18,
    letterSpacing: -0.1,
    fontFamily: AppConstants.primaryFont,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get h5 {
  return _styleWrapper(
    fontSize: 16,
    letterSpacing: -0.1,
    fontFamily: AppConstants.primaryFont,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get h6 {
  return _styleWrapper(
    fontSize: 14,
    letterSpacing: 0.0,
    fontFamily: AppConstants.primaryFont,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get bodyL {
  return _styleWrapper(
    fontSize: 16,
    letterSpacing: -0.1,
    fontFamily: AppConstants.primaryFont,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get bodyM {
  return _styleWrapper(
    fontSize: 14,
    letterSpacing: -0.2,
    fontFamily: AppConstants.primaryFont,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get bodyS {
  return _styleWrapper(
    fontSize: 12,
    letterSpacing: -0.1,
    fontFamily: AppConstants.primaryFont,
    fontWeight: FontWeight.w600,
  );
}
