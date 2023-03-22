import 'package:estilo_sob_medida/modules/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const ROUTE = '/welcome_screen';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                //height: Get.mediaQuery.size.height,
                color: AppColors.rosaClaro,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        'Bem-vindo ao\nEstiloSobMedida',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.playfairDisplay(
                          color: AppColors.rosaEscuro,
                          fontSize: 36,
                        ),
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(LoginScreen.ROUTE);
                        },
                        child: Text('Entrar'),
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.rosaEscuro,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          textStyle: GoogleFonts.lato(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 20),
                      OutlinedButton(
                        onPressed: () {
                          // Navegue para a tela de cadastro
                          Get.toNamed(RegisterScreen.ROUTE);
                        },
                        child: Text('Cadastrar-se'),
                        style: OutlinedButton.styleFrom(
                          primary: AppColors.rosaEscuro,
                          side: BorderSide(color: Color(0xFFF5CAC3), width: 2),
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          textStyle: GoogleFonts.lato(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
