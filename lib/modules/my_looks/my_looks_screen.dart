import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLooksScreen extends StatefulWidget {
  static const ROUTE = '/my_looks_screen';

  const MyLooksScreen({super.key});

  @override
  _MyLooksScreenState createState() => _MyLooksScreenState();
}

class _MyLooksScreenState extends State<MyLooksScreen> {
  List<String> myLooks = [
    // Adicione os caminhos das imagens dos looks aqui
    'https://img.ltwebstatic.com/gspCenter/goodsImage/2023/1/27/4367881230_1025768/B503E753A80BD9332891639A07DDF7F2_thumbnail_600x.jpg',
    'https://img.ltwebstatic.com/images3_pi/2022/05/31/1653965608359402db81e76bbb09eef6da6d4056f1_thumbnail_600x.webp',
    'https://img.ltwebstatic.com/images3_pi/2023/01/13/1673574746d33a90fab9bf218d8114ec2741e7ed5e_thumbnail_600x.webp',
    'https://img.ltwebstatic.com/gspCenter/goodsImage/2022/5/18/9677898565/D0AE0E1A57B3A17A31FF8FF32DF85F0E.jpg',
    'https://img.ltwebstatic.com/gspCenter/goodsImage/2023/1/8/3335814376_1044655/96610552248E2E9477A256961A4BAEBA_thumbnail_600x.jpg',
    'https://img.ltwebstatic.com/gspCenter/goodsImage/2023/1/26/8806866347_1045071/E86E942D7F02B36EF69BB01169D4B7E6_thumbnail_600x.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meus Looks',
          style: GoogleFonts.playfairDisplay(color: Color(0xFFE85A71)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isLargeScreen ? 3 : 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Implementar ação de clique para editar o look
                },
                onLongPress: () {
                  // Implementar ação de pressionar longamente para excluir o look
                },
                child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.black54,
                    title: Text(
                      'Curtidas: 42',
                      style: GoogleFonts.lato(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Comentários: 13',
                      style: GoogleFonts.lato(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.share, color: Colors.white),
                      onPressed: () {
                        // Implementar compartilhamento do look
                      },
                    ),
                  ),
                  child: Image.network(
                    myLooks[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: myLooks.length,
          ),
        ),
      ),
    );
  }
}
