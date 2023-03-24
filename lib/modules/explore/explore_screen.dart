import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../global_widgets/global_widgets.dart';

class ExploreScreen extends StatefulWidget {
  static const ROUTE = '/explore_screen';

  const ExploreScreen({super.key});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController searchController = TextEditingController();
  List<String> popularCategories = [
    'Casual',
    'Trabalho',
    'Festa',
    'Esporte',
    'Praia',
    'Inverno',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LhAppBar(title: 'Explorar', showBackButton: false, actions: []),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    labelText: 'Buscar looks',
                    labelStyle: TextStyle(color: AppColors.rosaEscuro),
                    prefixIcon: Icon(Icons.search, color: AppColors.rosaEscuro),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.rosaEscuro),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.rosaEscuro),
                    ),
                  ),
                  onSubmitted: (value) {
                    // Implementar a lógica de busca
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Categorias Populares',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: AppColors.rosaEscuro,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: popularCategories.map((category) {
                    return Chip(
                      label: Text(
                        category,
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: AppColors.rosaEscuro,
                      // onPressed: () {
                      //   // Implementar a lógica de busca por categoria
                      // },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                // Implementar a exibição dos looks encontrados em formato de grade ou lista
              ],
            ),
          ),
        ),
      ),
    );
  }
}
