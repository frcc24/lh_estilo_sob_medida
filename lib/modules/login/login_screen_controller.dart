import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  final RxBool isEmailValid = false.obs;
  final RxBool isPasswordValid = false.obs;

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
