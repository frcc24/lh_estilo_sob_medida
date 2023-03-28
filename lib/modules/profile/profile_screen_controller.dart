import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  String profilePicture = '';
  String userName = '';
  String userDescription = '';

  @override
  onInit() async {
    super.onInit();
    isLoading.value = true;
    await FirebaseFirestore.instance.collection('users').doc('hyHt0a0RLgNLXqunBT3yyfrm4D42').get().then((value) {
      profilePicture = value.data()!['profile_picture'];
      userName = value.data()!['username'];
      userDescription = value.data()!['bio'];
    });
    isLoading.value = false;
  }
}
