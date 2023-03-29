import 'package:get/get.dart';

import '../data/user_model.dart';

class UserController extends GetxController {
  // Variável para armazenar os dados do usuário
  Rx<UserModel?> user = Rx<UserModel?>(UserModel(
    id: '',
    username: '',
    email: '',
    profilePicture: '',
    bio: '',
  ));

  // Método para atualizar os dados do usuário
  void updateUser(UserModel? newUser) {
    user.value = newUser;
  }
}
