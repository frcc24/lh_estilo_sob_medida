import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../global_widgets/global_widgets.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const ROUTE = '/login_screen';

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const LhAppBar(title: 'Login', showBackButton: true, actions: []),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
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
                  LhTextFormField(
                    label: 'E-mail',
                    controller: emailController,
                    onChanged: (value) {
                      // setState(() {
                      //   emailController.text = value;
                      // });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu E-mail';
                      }
                      return null;
                    },
                  ),
                  LhTextFormField(
                    label: 'Senha',
                    controller: passwordController,
                    onChanged: (value) {
                      // setState(() {
                      //   passwordController.text = value;
                      // });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira sua senha';
                      }
                      return null;
                    },
                  ),
                  LhPrimaryButton(
                    formKey: _formKey,
                    label: 'Entrar',
                    onPressed: () {
                      Get.offNamed(HomeScreen.ROUTE);
                    },
                  ),
                  const SizedBox(height: 20),
                  LhSecondaryButton(
                    hideBorder: true,
                    onPressed: () {
                      // Implementar a lógica de redefinição de senha
                    },
                    child: const Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(color: AppColors.rosaEscuro),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
