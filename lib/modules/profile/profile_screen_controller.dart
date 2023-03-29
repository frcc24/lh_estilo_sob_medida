import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/controllers/user_controller.dart';
import '../welcome_screen/welcome_screen.dart';

class ProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  String profilePicture = '';
  String userName = '';
  String userDescription = '';

  Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      // Desconectar do Google
      await googleSignIn.signOut();

      // Desconectar do FirebaseAuth
      await firebaseAuth.signOut();

      print("Usuário desconectado com sucesso.");
      Get.offAllNamed(WelcomeScreen.ROUTE);
    } catch (error) {
      print("Erro ao desconectar: $error");
    }
  }

  @override
  onInit() async {
    super.onInit();
    isLoading.value = true;

    final user = Get.find<UserController>().user.value!;
    profilePicture = user.profilePicture;
    userName = user.username;
    userDescription = user.bio;

    isLoading.value = false;
  }
}
