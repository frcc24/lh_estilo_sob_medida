import 'package:estilo_sob_medida/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'color_theme.dart';

ThemeData createTheme() {
  final theme = ThemeData.from(colorScheme: createColorScheme());
  final lightTextTheme = createTextTheme(Brightness.light);
  final darkTextTheme = createTextTheme(Brightness.dark);

  return theme.copyWith(
    useMaterial3: false,
    textTheme: lightTextTheme,
    primaryTextTheme: darkTextTheme,
    dividerTheme: const DividerThemeData(space: 0, color: AppColors.grey10),
    splashColor: theme.colorScheme.primary.withOpacity(0.20),
    highlightColor: Colors.transparent,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.blueWarmVivid70),
    iconTheme: const IconThemeData(color: AppColors.whiteHighEmphashis),
    appBarTheme: const AppBarTheme(titleSpacing: 0.0, elevation: 0.0),
    scrollbarTheme: const ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all(AppColors.blackInactive),
      trackColor: MaterialStateProperty.all(AppColors.grey20),
      thumbVisibility: MaterialStateProperty.all(true),
      interactive: true,
      radius: const Radius.circular(2),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: AppColors.rosaClaro),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: AppColors.rosaClaro),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: AppColors.rosaEscuro),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: AppColors.redError),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: AppColors.redError),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: AppColors.grey10),
      ),
      labelStyle: lightTextTheme.bodyText1!.copyWith(color: AppColors.grey30),
      hintStyle: lightTextTheme.bodyText1!.copyWith(color: AppColors.grey30),
      errorStyle: lightTextTheme.bodyText1!.copyWith(color: AppColors.redError),
      helperStyle: lightTextTheme.bodyText1!.copyWith(color: AppColors.grey30),
      isDense: true,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AppColors.rosaEscuro,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: AppColors.rosaEscuro,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.rosaEscuro,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
  );
}
