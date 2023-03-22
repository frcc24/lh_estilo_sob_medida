import 'package:estilo_sob_medida/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'color_theme.dart';

ThemeData createTheme() {
  final theme = ThemeData.from(colorScheme: createColorScheme());
  final lightTextTheme = createTextTheme(Brightness.light);
  final darkTextTheme = createTextTheme(Brightness.dark);

  return theme.copyWith(
    textTheme: lightTextTheme,
    primaryTextTheme: darkTextTheme,
    dividerTheme: const DividerThemeData(space: 0, color: AppColors.grey10),
    splashColor: theme.colorScheme.primary.withOpacity(0.20),
    highlightColor: Colors.transparent,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.blueWarmVivid70),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.blueWarmVivid70)),
    ),
    iconTheme: const IconThemeData(color: AppColors.whiteHighEmphashis),
    appBarTheme: const AppBarTheme(titleSpacing: 0.0, elevation: 0.0),
    scrollbarTheme: const ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all(AppColors.blackInactive),
      trackColor: MaterialStateProperty.all(AppColors.grey20),
      thumbVisibility: MaterialStateProperty.all(true),
      interactive: true,
      radius: const Radius.circular(2),
    ),
  );
}
