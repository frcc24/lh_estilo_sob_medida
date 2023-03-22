import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const ROUTE = '/login_screen';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.rosaEscuro),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Entrar',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: AppColors.rosaEscuro,
                    fontSize: 36,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: AppColors.rosaEscuro),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.rosaEscuro),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.rosaEscuro),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: AppColors.rosaEscuro),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.rosaEscuro),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.rosaEscuro),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Implementar a lógica de redefinição de senha
                  },
                  child: Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(color: AppColors.rosaEscuro),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implementar a lógica de login
                    Get.toNamed(HomeScreen.ROUTE);
                  },
                  child: Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.rosaEscuro,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    textStyle: GoogleFonts.montserrat(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
