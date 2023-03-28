import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estilo_sob_medida/modules/create_look/create_look_screen.dart';
import 'package:estilo_sob_medida/modules/explore/explore_screen.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../global_widgets/global_widgets.dart';
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
    CreateLookScreen(),
    const MyLooksScreen(),
    ProfileScreen(),
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
        items: const [
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
        selectedItemColor: AppColors.rosaEscuro,
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
      appBar: LhAppBar(title: 'Feed de Looks', showBackButton: false, actions: [
        IconButton(
          icon: const Icon(Icons.filter_list, color: AppColors.rosaEscuro),
          onPressed: () {
            // Implementar a lógica de filtragem
          },
        ),
      ]),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.none:
                  return const Center(child: Text('Nenhum dado encontrado'));
                default:
                  if (snapshot.hasError) {
                    return const Center(child: Text('Erro ao carregar os dados'));
                  } else {
                    List<DocumentSnapshot> docs = snapshot.data!.docs.reversed.toList();
                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PostCard(doc: docs[index].data() as Map<String, dynamic>);
                      },
                    );
                  }
              }
            },
          )),
        ],
      ),
    );
  }
}
