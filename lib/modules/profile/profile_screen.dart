import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../core/theme/app_colors.dart';
import '../welcome_screen/welcome_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const ROUTE = '/profile_screen';

  final String userImageUrl;
  final String userName;
  final String userDescription;

  const ProfileScreen({
    super.key,
    required this.userImageUrl,
    required this.userName,
    required this.userDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: GoogleFonts.montserrat(color: AppColors.rosaEscuro),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              foregroundImage: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: userImageUrl,
                fit: BoxFit.cover,
              ).image,
              backgroundColor: AppColors.blueWarmVivid05,
              radius: 60,
            ),
            const SizedBox(height: 20),
            Text(
              userName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              userDescription,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informações',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Coloque informações adicionais aqui.'),
                      // Adicione mais informações, como e-mail, telefone, etc.
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navegar para a tela de edição de perfil
                    },
                    icon: Icon(Icons.edit),
                    label: Text('Editar perfil'),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.rosaEscuro,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      textStyle: GoogleFonts.montserrat(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implementar o logout
                      Get.offAllNamed(WelcomeScreen.ROUTE);
                    },
                    icon: Icon(Icons.exit_to_app),
                    label: Text('Sair'),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.rosaEscuro,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      textStyle: GoogleFonts.montserrat(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
