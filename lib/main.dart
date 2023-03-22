import 'package:estilo_sob_medida/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/theme/app_theme.dart';
import 'modules/welcome_screen/welcome_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Style under Mesure',
      getPages: getAppPages(),
      theme: createTheme(),
      themeMode: ThemeMode.light,
      home: const WelcomeScreen(),
    ),
  );
}
