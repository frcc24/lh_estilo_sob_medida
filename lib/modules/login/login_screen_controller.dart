import 'package:estilo_sob_medida/modules/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/theme/app_colors.dart';

class LoginScreenController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  final _currentUser = Rx<User?>(null);

  final RxBool isEmailValid = false.obs;
  final RxBool isPasswordValid = false.obs;

  final googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    super.onInit();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.snackbar('', 'User is currently signed out!');
      } else {
        _currentUser.value = user;
      }
    });
  }

  void googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final authResult = await FirebaseAuth.instance.signInWithCredential(credential);
        final user = authResult.user;
        Get.snackbar('Google Auth', 'Bem vindo! ${user?.displayName}',
            snackStyle: SnackStyle.FLOATING, backgroundColor: AppColors.azulPetroleo, colorText: AppColors.whiteHighEmphashis);
        Get.toNamed(HomeScreen.ROUTE);
      } else {
        Get.snackbar('Google Auth is null', 'Google Auth is null',
            snackStyle: SnackStyle.FLOATING, backgroundColor: AppColors.blackDisabled, colorText: AppColors.whiteHighEmphashis);
      }
    } catch (error) {
      print(error.toString());
      Get.snackbar('Google Auth fail', error.toString(),
          snackStyle: SnackStyle.FLOATING, backgroundColor: AppColors.blackDisabled, colorText: AppColors.whiteHighEmphashis);
    }
  }

  updateEmail(String value) {
    email.value = value;
    isEmailValid.value = value.isNotEmpty;
  }

  updatePassword(String value) {
    password.value = value;
    isPasswordValid.value = value.isNotEmpty;
  }

  bool get isValid => isEmailValid.value && isPasswordValid.value;

  login() {
    // implementar a lógica de login aqui
    print('email: ${email.value}');
    print('password: ${password.value}');
  }
}
