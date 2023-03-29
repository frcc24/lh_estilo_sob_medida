import 'package:estilo_sob_medida/global_widgets/post_card/post_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../core/theme/app_colors.dart';

class PostCard extends StatelessWidget {
  PostCard({
    super.key,
    required this.doc,
    required this.postId,
  });

  final Map<String, dynamic> doc;
  final String postId;

  @override
  Widget build(BuildContext context) {
    Get.put(PostCardController(), tag: doc['userId']);
    final controller = Get.find<PostCardController>(tag: doc['userId']);

    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              doc['imageUrl'],
              scale: 0.7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border, color: AppColors.rosaEscuro),
                  onPressed: () {
                    // Implementar a lógica de curtir
                    controller.likePost(postId);
                  },
                ),
                Text(doc['likes'].toString(), style: const TextStyle(color: AppColors.rosaEscuro)),
                IconButton(
                  icon: Icon(Icons.comment, color: AppColors.rosaEscuro),
                  onPressed: () {
                    // Implementar a lógica de comentar
                  },
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.share, color: AppColors.rosaEscuro),
                  onPressed: () {
                    // Implementar a lógica de compartilhar
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FutureBuilder<String>(
                    future: controller.getPostUserProfilePicture(doc['userId']),
                    builder: (context, snapshot) {
                      // if (snapshot.connectionState == ConnectionState.waiting) {
                      //   // return SizedBox(width: 20, height: 20, child: const CircularProgressIndicator());
                      //   return const SizedBox(width: 20, height: 20);
                      // } else
                      {
                        return Row(
                          children: [
                            CircleAvatar(
                              foregroundImage: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: snapshot.data?.isNotEmpty == true ? snapshot.data! : doc['imageUrl'],
                                fit: BoxFit.cover,
                              ).image,
                              backgroundColor: AppColors.blueWarmVivid05,
                              radius: 15,
                            ),
                            const SizedBox(width: 10),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 120),
                              child: Text(
                                '${controller.postUserName.value}:',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      doc['caption'],
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
