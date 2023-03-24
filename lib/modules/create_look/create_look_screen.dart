import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/theme/app_colors.dart';
import '../../global_widgets/lh_app_bar.dart';

class CreateLookScreen extends StatefulWidget {
  static const ROUTE = '/create_look_screen';

  const CreateLookScreen({super.key});

  @override
  _CreateLookScreenState createState() => _CreateLookScreenState();
}

class _CreateLookScreenState extends State<CreateLookScreen> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController keywordsController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    child: _image == null
                        ? Center(child: Icon(Icons.add_a_photo, color: AppColors.rosaEscuro))
                        : Image.file(File(_image!.path), fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    labelStyle: TextStyle(color: AppColors.rosaEscuro),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.rosaEscuro),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.rosaEscuro),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: keywordsController,
                  decoration: InputDecoration(
                    labelText: 'Palavras-chave',
                    labelStyle: TextStyle(color: AppColors.rosaEscuro),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.rosaEscuro),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.rosaEscuro),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: categoryController,
                  decoration: InputDecoration(
                    labelText: 'Categoria',
                    labelStyle: TextStyle(color: AppColors.rosaEscuro),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.rosaEscuro),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.rosaEscuro),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implementar a lógica de login
                    //Get.toNamed(HomeScreen.ROUTE);
                  },
                  child: Text('Salvar'),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.rosaEscuro,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    textStyle: GoogleFonts.montserrat(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
