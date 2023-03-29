import 'package:get/get.dart';

import '../../core/controllers/user_controller.dart';

class CreateLookScreenController extends GetxController {
  RxBool isLoadingPage = false.obs;
  RxBool isLoadingImage = false.obs;
  final user = Get.find<UserController>().user.value!;

  Future<void> onInit() async {
    super.onInit();
    isLoadingPage.value = true;

    isLoadingPage.value = false;
  }
}
