import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estilo_sob_medida/global_widgets/global_widgets.dart';
import 'package:estilo_sob_medida/modules/home/home_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/theme/app_colors.dart';
import 'create_look_screen_controller.dart';

class CreateLookScreen extends GetView<CreateLookScreenController> {
  static const ROUTE = '/create_look_screen';

  CreateLookScreen({super.key});

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController keywordsController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  XFile? _image;
  var imageUrl = '';

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      controller.isLoadingImage.value = true;
      final storageRef = FirebaseStorage.instance.ref().child('looks').child('Nat');
      final uploadTask = storageRef.putFile(File(image.path));
      final taskSnapshot = await uploadTask.whenComplete(() {
        _image = image;
        controller.isLoadingImage.value = false;
      });
      imageUrl = await taskSnapshot.ref.getDownloadURL();
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CreateLookScreenController());
    return Scaffold(
      appBar: const LhAppBar(title: 'Criar Look', showBackButton: false, actions: []),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Obx(
                      () => controller.isLoadingImage.value
                          ? const SizedBox(height: 20, width: 20, child: Center(child: CircularProgressIndicator()))
                          : _image == null
                              ? const Center(child: Icon(Icons.add_a_photo, color: AppColors.rosaEscuro))
                              : Image.file(File(_image!.path), fit: BoxFit.scaleDown),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                LhTextFormField(
                  controller: descriptionController,
                  label: 'Descricao',
                ),
                LhTextFormField(
                  controller: keywordsController,
                  label: 'Palavras-chave',
                ),
                LhTextFormField(
                  controller: categoryController,
                  label: 'Categoria',
                ),
                LhPrimaryButton(
                  onPressed: () async {
                    final CollectionReference collectionReference = FirebaseFirestore.instance.collection('posts');

                    /*
                    postId (documento): ID da postagem.
                    userId: ID do usuário que criou a postagem.
                    imageUrl: URL da imagem.
                    caption: legenda da imagem (texto).
                    timestamp: data e hora da criação da postagem.
                    likes: número de curtidas.*/

                    collectionReference.doc().set({
                      'userId': '',
                      'imageUrl': imageUrl,
                      'caption': descriptionController.text,
                      'keywords': keywordsController.text,
                      'category': categoryController.text,
                      'timestamp': DateTime.now(),
                      'likes': 0,
                    });

                    Get.offAllNamed(HomeScreen.ROUTE);
                  },
                  label: 'Salvar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
