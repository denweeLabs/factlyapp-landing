part of 'app_theme.dart';

ThemeData darkTheme() {
  return ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: AppColors.primaryBackground[ThemeType.dark],
    shadowColor: AppColors.shadow[ThemeType.dark],
    dividerColor: AppColors.divider[ThemeType.dark],
    dividerTheme: DividerThemeData(color: AppColors.divider[ThemeType.dark]),
    colorScheme: const ColorScheme.dark().copyWith(
      background: AppColors.primaryBackground[ThemeType.dark],
      onBackground: AppColors.secondaryBackground[ThemeType.dark],
      error: AppColors.lightRed,
      shadow: AppColors.shadow[ThemeType.dark],
      primaryContainer: AppColors.primaryContainer[ThemeType.dark],
      secondaryContainer: AppColors.secondaryContainer[ThemeType.dark],
    ),
  );
}
