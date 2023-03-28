import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    await FirebaseFirestore.instance.collection('users').doc('25l4pX7fbIg37D9a8qYdnr0u35D3').get().then((value) {
      profilePicture = value.data()!['profile_picture'];
      userName = value.data()!['username'];
      userDescription = value.data()!['bio'];
    });
    isLoading.value = false;
  }
}
