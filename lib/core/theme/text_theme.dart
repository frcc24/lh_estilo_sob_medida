import 'package:flutter/material.dart';

import 'app_colors.dart';

TextTheme createTextTheme(Brightness brightness) {
  final color = brightness == Brightness.light ? AppColors.grey90 : AppColors.whiteHighEmphashis;

  return TextTheme(
    headline1: TextStyle(fontWeight: FontWeight.w300, fontSize: 104.02, color: color),
    headline2: TextStyle(fontWeight: FontWeight.w400, fontSize: 60.2, color: color),
    headline3: TextStyle(fontWeight: FontWeight.normal, fontSize: 32, color: color),
    headline4: TextStyle(fontWeight: FontWeight.w400, fontSize: 34.84, color: color),
    headline5: TextStyle(fontWeight: FontWeight.w500, fontSize: 24.19, color: color),
    headline6: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.16, color: color),
    bodyText1: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.8, color: color),
    bodyText2: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: color),
    subtitle2: TextStyle(fontWeight: FontWeight.w500, fontSize: 11.67, color: color),
    caption: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: color),
    overline: TextStyle(fontWeight: FontWeight.w700, fontSize: 11.67, color: color),
    button: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: color, letterSpacing: 0.05),
  ).apply(fontFamily: 'Roboto');
}
