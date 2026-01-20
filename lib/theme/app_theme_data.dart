import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:flutter/material.dart';

@immutable
class AppThemeData {
  final ThemeMode mode;
  final int colorationId;

  const AppThemeData({required this.mode, required this.colorationId});

  factory AppThemeData.fromMode(ThemeMode mode) {
    return AppThemeData(
      mode: mode,
      colorationId: AppConstants.defaultThemeColorationId,
    );
  }

  AppThemeData copyWith({ThemeMode? mode, int? colorationId}) {
    return AppThemeData(
      mode: mode ?? this.mode,
      colorationId: colorationId ?? this.colorationId,
    );
  }
}

@immutable
class ThemeColoration {
  final int id;
  final Color primary;
  final Color secondary;

  const ThemeColoration({
    required this.id,
    required this.primary,
    required this.secondary,
  });
}
