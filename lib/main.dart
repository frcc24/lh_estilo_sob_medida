import 'package:estilo_sob_medida/routes/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/theme/app_theme.dart';
import 'firebase_options.dart';
import 'modules/welcome_screen/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Style Under Measure',
      getPages: getAppPages(),
      theme: createTheme(),
      themeMode: ThemeMode.light,
      home: const WelcomeScreen(),
    ),
  );
}
