import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../core/theme/app_colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.doc,
  });

  final Map<String, dynamic> doc;

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border, color: AppColors.rosaEscuro),
                  onPressed: () {
                    // Implementar a lógica de curtir
                  },
                ),
                IconButton(
                  icon: Icon(Icons.comment, color: AppColors.rosaEscuro),
                  onPressed: () {
                    // Implementar a lógica de comentar
                  },
                ),
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
                  CircleAvatar(
                    foregroundImage: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: doc['imageUrl'],
                      fit: BoxFit.cover,
                    ).image,
                    backgroundColor: AppColors.blueWarmVivid05,
                    radius: 15,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    doc['caption'],
                    style: TextStyle(fontSize: 20),
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
