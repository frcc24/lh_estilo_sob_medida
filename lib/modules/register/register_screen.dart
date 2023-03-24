import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../global_widgets/global_widgets.dart';

class RegisterScreen extends StatefulWidget {
  static const ROUTE = '/register_screen';

  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LhAppBar(title: 'Cadastrar', showBackButton: true, actions: []),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LhTextFormField(
                label: 'Nome',
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
              LhTextFormField(
                label: 'E-mail',
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
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
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              LhTextFormField(
                label: 'Confirme a senha',
                onChanged: (value) {
                  setState(() {
                    _confirmPassword = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirme sua senha';
                  }
                  if (value != _password) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Implementar a lógica de login
                  //Get.toNamed(HomeScreen.ROUTE);
                  if (_formKey.currentState!.validate()) {
                    // Processar registro
                    print('Nome: $_name');
                    print('E-mail: $_email');
                    print('Senha: $_password');
                  }
                },
                child: Text('Cadastrar'),
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
    );
  }
}
