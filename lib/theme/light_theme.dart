part of 'app_theme.dart';

ThemeData lightTheme() {
  return ThemeData.light(useMaterial3: true).copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.primaryBackground[ThemeType.light],
    shadowColor: AppColors.shadow[ThemeType.light],
    dividerColor: AppColors.divider[ThemeType.light],
    dividerTheme: DividerThemeData(color: AppColors.divider[ThemeType.light]),
    colorScheme: const ColorScheme.light().copyWith(
      background: AppColors.primaryBackground[ThemeType.light],
      onBackground: AppColors.secondaryBackground[ThemeType.light],
      error: AppColors.lightRed,
      shadow: AppColors.shadow[ThemeType.light],
      primaryContainer: AppColors.primaryContainer[ThemeType.light],
      secondaryContainer: AppColors.secondaryContainer[ThemeType.light],
    ),
  );
}
