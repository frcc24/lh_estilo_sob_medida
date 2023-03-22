import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../login/login_screen.dart';
import '../register/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const ROUTE = '/welcome_screen';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Get.theme.colorScheme.onBackground.withOpacity(0.5),
                  Get.theme.colorScheme.primary,
                ],
                stops: const [0.0, 1.0],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Bem-vindo ao\nEstilo Sob Medida',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: AppColors.rosaEscuro,
                    fontSize: 36,
                  ),
                ),
                const Spacer(),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(LoginScreen.ROUTE);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.rosaEscuro,
                    onPrimary: AppColors.whiteSmoke,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: GoogleFonts.montserrat(fontSize: 20),
                  ),
                  child: const Text('Entrar'),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    // Navegue para a tela de cadastro
                    Get.toNamed(RegisterScreen.ROUTE);
                  },
                  style: OutlinedButton.styleFrom(
                    primary: AppColors.rosaEscuro,
                    side: const BorderSide(color: AppColors.rosaMillenial, width: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: GoogleFonts.montserrat(fontSize: 20),
                  ),
                  child: const Text('Cadastrar-se', style: TextStyle(color: AppColors.rosaClaro)),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
