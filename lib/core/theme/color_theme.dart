import 'package:flutter/material.dart';

import 'app_colors.dart';

ColorScheme createColorScheme() {
  return ColorScheme(
    primary: AppColors.rosaEscuro,
    secondary: AppColors.rosaClaro,
    background: AppColors.whiteHighEmphashis,
    surface: AppColors.whiteSurface,
    error: AppColors.redError,
    onPrimary: AppColors.whiteHighEmphashis,
    onSecondary: AppColors.whiteHighEmphashis,
    onBackground: AppColors.blackSurface,
    onSurface: AppColors.blackSurface,
    onError: AppColors.whiteHighEmphashis,
    brightness: Brightness.light,
  );
}
