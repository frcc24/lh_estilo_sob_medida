import 'package:estilo_sob_medida/modules/create_look/create_look_screen.dart';
import 'package:estilo_sob_medida/modules/explore/explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../my_looks/my_looks_screen.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const ROUTE = '/home_screen';

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    // Lista de telas que você deseja alternar
    // Adicione sua tela "Explorar" aqui
    const HomeList(),
    const ExploreScreen(),
    const CreateLookScreen(),
    const MyLooksScreen(),
    const ProfileScreen(
      userDescription: 'LOren askjasd',
      userName: 'Nat Locesa',
      userImageUrl: 'https://i.pinimg.com/736x/b2/a7/c6/b2a7c6230ef87ab2a57755afc7760b3b.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      // body:
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explorar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Criar look',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Meus looks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFE85A71),
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            switch (index) {
              case 0:
                //Get.toNamed(ExploreScreen.ROUTE);
                break;
              case 1:
                //Navigator.pushNamed(context, '/create_look_screen');
                break;
              case 2:
                // Navigator.pushNamed(context, '/my_looks_screen');
                break;
              case 3:
                // Navigator.pushNamed(context, '/profile_screen');
                break;
            }
            // Implementar a navegação para as telas selecionadas
          });
        },
      ),
    );
  }
}

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feed de Looks',
          style: GoogleFonts.playfairDisplay(color: Color(0xFFE85A71)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Color(0xFFE85A71)),
            onPressed: () {
              // Implementar a lógica de filtragem
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // Número de looks no feed
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                Image.network(
                  'https://img.ltwebstatic.com/images3_pi/2020/09/14/16000572106acedea9669cee2c3b2e34369e074a31_thumbnail_600x.webp', // URL da imagem do look
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border, color: Color(0xFFE85A71)),
                      onPressed: () {
                        // Implementar a lógica de curtir
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.comment, color: Color(0xFFE85A71)),
                      onPressed: () {
                        // Implementar a lógica de comentar
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.share, color: Color(0xFFE85A71)),
                      onPressed: () {
                        // Implementar a lógica de compartilhar
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
