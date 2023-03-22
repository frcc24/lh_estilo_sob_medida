import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFE85A71)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Explorar',
          style: GoogleFonts.playfairDisplay(color: Color(0xFFE85A71)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Buscar looks',
                    labelStyle: TextStyle(color: Color(0xFFE85A71)),
                    prefixIcon: Icon(Icons.search, color: Color(0xFFE85A71)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE85A71)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE85A71)),
                    ),
                  ),
                  onSubmitted: (value) {
                    // Implementar a lógica de busca
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Categorias Populares',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Color(0xFFE85A71),
                  ),
                ),
                SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: popularCategories.map((category) {
                    return Chip(
                      label: Text(
                        category,
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color(0xFFE85A71),
                      // onPressed: () {
                      //   // Implementar a lógica de busca por categoria
                      // },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                // Implementar a exibição dos looks encontrados em formato de grade ou lista
              ],
            ),
          ),
        ),
      ),
    );
  }
}
