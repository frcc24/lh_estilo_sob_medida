import 'package:estilo_sob_medida/modules/profile/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../core/theme/app_colors.dart';
import '../../global_widgets/lh_app_bar.dart';
import '../welcome_screen/welcome_screen.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  static const ROUTE = '/profile_screen';

  ProfileScreen({
    super.key,
  }) {
    Get.put(ProfileScreenController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LhAppBar(title: 'Perfil', showBackButton: false, actions: []),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    CircleAvatar(
                      foregroundImage: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: controller.profilePicture,
                        fit: BoxFit.cover,
                      ).image,
                      backgroundColor: AppColors.blueWarmVivid05,
                      radius: 60,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      controller.userName,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.userDescription,
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
                              textStyle: GoogleFonts.montserrat(fontSize: 20),
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
                              textStyle: GoogleFonts.montserrat(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
        ),
      ),
    );
  }
}
