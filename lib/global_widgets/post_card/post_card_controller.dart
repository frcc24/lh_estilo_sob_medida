import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estilo_sob_medida/core/controllers/user_controller.dart';
import 'package:get/get.dart';

class PostCardController extends GetxController {
  RxBool isLoading = false.obs;
  final postUserProfilePicture = ''.obs;
  final postUserName = ''.obs;
  final userId = Get.find<UserController>().user.value!.id;

  Future<String> getPostUserProfilePicture(String postUserId) async {
    final result = await FirebaseFirestore.instance.collection('users').doc(postUserId).get();
    postUserProfilePicture.value = result.data()!['profile_picture'];
    postUserName.value = result.data()!['username'];
    return postUserProfilePicture.value;
  }

  Future<void> likePost(String postId) async {
    await FirebaseFirestore.instance.collection('likes').add({
      'postId': postId,
      'userId': userId,
    });
    await FirebaseFirestore.instance.collection('posts').doc(postId).update({
      'likes': FieldValue.increment(1),
    });
  }
}
