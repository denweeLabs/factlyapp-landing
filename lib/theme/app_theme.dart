import 'package:factlyapp_landing/theme/app_colors.dart';
import 'package:flutter/material.dart';

part 'dark_theme.dart';
part 'light_theme.dart';

class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier._(super.value);

  bool get isLight => value == ThemeMode.light;

  factory ThemeNotifier.fromPlatformBrightness(Brightness brightness) {
    final mode = brightness == Brightness.light
        ? ThemeMode.light
        : ThemeMode.dark;
    return ThemeNotifier._(mode);
  }

  void toggleTheme() {
    final isLight = value == ThemeMode.light;
    value = isLight ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

enum ThemeType { light, dark }

class AppTheme {
  final ThemeType type;

  const AppTheme._(this.type);

  factory AppTheme.fromType(ThemeType type) => AppTheme._(type);

  ThemeData themeData() {
    switch (type) {
      case ThemeType.dark:
        return darkTheme();
      default:
        return lightTheme();
    }
  }
}

extension ThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isLightTheme => theme.brightness == Brightness.light;
  ThemeType get themeType => isLightTheme ? ThemeType.light : ThemeType.dark;

  Color get textColor => AppColors.text[themeType]!;
  Color get textColorSecondary => AppColors.textSecondary[themeType]!;
  Color get textColorTernary => AppColors.textTernary[themeType]!;
  Color get lightTextColor => AppColors.text[ThemeType.dark]!;
  Color get lightTextColorSecondary => AppColors.textSecondary[ThemeType.dark]!;
  Color get lightTextColorTernary => AppColors.textTernary[ThemeType.dark]!;
  Color get darkTextColor => AppColors.text[ThemeType.light]!;

  Color get iconColor => AppColors.icon[themeType]!;
  Color get iconColorSecondary => AppColors.iconSecondary[themeType]!;
  Color get iconColorTernary => AppColors.iconTernary[themeType]!;
  Color get lightIconColor => AppColors.icon[ThemeType.dark]!;
  Color get lightIconColorSecondary => AppColors.iconSecondary[ThemeType.dark]!;
  Color get lightIconColorTernanry => AppColors.iconTernary[ThemeType.dark]!;
  Color get darkIconColor => AppColors.icon[ThemeType.light]!;

  Color get primaryContainer => AppColors.primaryContainer[themeType]!;
  Color get secondaryContainer => AppColors.secondaryContainer[themeType]!;
  Color get lightPrimaryContainer => AppColors.primaryContainer[ThemeType.light]!;
  Color get darkPrimaryContainer => AppColors.primaryContainer[ThemeType.dark]!;
  Color get lightSecondaryContainer => AppColors.secondaryContainer[ThemeType.light]!;
  Color get darkSecondaryContainer => AppColors.secondaryContainer[ThemeType.dark]!;
}
