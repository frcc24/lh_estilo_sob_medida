import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PostCardController extends GetxController {
  RxBool isLoading = false.obs;
  final postUserProfilePicture = ''.obs;
  final postUserName = ''.obs;

  Future<String> getPostUserProfilePicture(String postUserId) async {
    final result = await FirebaseFirestore.instance.collection('users').doc(postUserId).get();
    postUserProfilePicture.value = result.data()!['profile_picture'];
    postUserName.value = result.data()!['username'];
    return postUserProfilePicture.value;
  }
}
