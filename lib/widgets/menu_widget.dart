import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:lavvi_app/pages/home_page.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Drawer(
        shape: InputBorder.none,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            ExpansionTileGroup(
              children: [
                ExpansionTileItem(
                  tilePadding: EdgeInsets.only(left: 36, right: 16),
                  border: Border(
                    bottom: BorderSide(
                      width: 0.1,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    'MEU PERFIL',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(95, 95, 95, 1),
                    ),
                  ),
                  children: [Text('NADAA')],
                ),
                ExpansionTileItem(
                  tilePadding: EdgeInsets.only(left: 36, right: 16),
                  border: Border(
                    bottom: BorderSide(
                      width: 0.1,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    'MEUS IMÓVEIS',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(95, 95, 95, 1),
                    ),
                  ),
                  children: [Text('NADAA')],
                ),
                ExpansionTileItem(
                  tilePadding: EdgeInsets.only(left: 36, right: 16),
                  border: Border(
                    bottom: BorderSide(
                      width: 0.1,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    'FINANCEIRO',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(95, 95, 95, 1),
                    ),
                  ),
                  children: [Text('NADAA')],
                ),
                ExpansionTileItem(
                  tilePadding: EdgeInsets.only(left: 36, right: 16),
                  border: Border(
                    bottom: BorderSide(
                      width: 0.1,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    'JURIDICO',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(95, 95, 95, 1),
                    ),
                  ),
                  children: [Text('NADAA')],
                ),
                ExpansionTileItem(
                  tilePadding: EdgeInsets.only(left: 36, right: 16),
                  border: Border(
                    bottom: BorderSide(
                      width: 0.1,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    'REPASSE',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(95, 95, 95, 1),
                    ),
                  ),
                  children: [Text('NADAA')],
                ),
                ExpansionTileItem(
                  tilePadding: EdgeInsets.only(left: 36, right: 16),
                  border: Border(
                    bottom: BorderSide(
                      width: 0.1,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    'COMERCIAL',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(95, 95, 95, 1),
                    ),
                  ),
                  children: [Text('NADAA')],
                ),
                ExpansionTileItem(
                  tilePadding: EdgeInsets.only(left: 36, right: 16),
                  border: Border(
                    bottom: BorderSide(
                      width: 0.1,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    'FAQ',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(95, 95, 95, 1),
                    ),
                  ),
                  children: [Text('NADAA')],
                ),
                ExpansionTileItem(
                  tilePadding: EdgeInsets.only(left: 36, right: 16),
                  border: Border(
                    bottom: BorderSide(
                      width: 0.1,
                      style: BorderStyle.solid,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    'SOBRE',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(95, 95, 95, 1),
                    ),
                  ),
                  children: [Text('NADAA')],
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleIcon(
                  iconAsset: 'assets/icons/facebook.png',
                ),
                SizedBox(width: 16),
                CircleIcon(
                  iconAsset: 'assets/icons/instagram.png',
                ),
                SizedBox(width: 16),
                CircleIcon(
                  iconAsset: 'assets/icons/twitter.png',
                ),
                SizedBox(width: 16),
                CircleIcon(
                  iconAsset: 'assets/icons/youtube.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
