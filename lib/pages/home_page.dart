import 'package:flutter/material.dart';
import 'package:lavvi_app/components/elevated_button_component.dart';
import 'package:lavvi_app/widgets/menu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        shape: InputBorder.none,
        backgroundColor: const Color.fromRGBO(13, 28, 47, 1),
        title: const Row(
          children: [
            Text(
              'FINANCEIRO',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 24),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
              color: Colors.white,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
        leading: const SizedBox(),
        leadingWidth: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              color: const Color.fromRGBO(13, 28, 47, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 32),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 110,
                          color: Color.fromRGBO(166, 146, 73, 1),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'SEU NOME',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            letterSpacing: 3),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'seuemail@gmail.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          letterSpacing: 3,
                        ),
                      ),
                      Container(
                        width: 280,
                        margin: const EdgeInsets.only(top: 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'PARCELA 14 DE 20',
                              style: TextStyle(
                                fontSize: 12,
                                letterSpacing: 1,
                                color: Color.fromRGBO(28, 28, 36, 1),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'R\$14,180.20',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1,
                                color: Color.fromRGBO(93, 93, 93, 1),
                              ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButtonComponent(
                              label: 'PAGAR',
                              color: const Color.fromRGBO(166, 146, 73, 1),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 8,
                    margin: const EdgeInsets.only(bottom: 1),
                    color: const Color.fromRGBO(169, 145, 73, 1),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'NOTIFICAÇÕES',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 150,
                          child: Text(
                            'NOVO BOLETO DISPONÍVEL',
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'R\$2,030.80',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text('Financeiro Lavvi'),
                  contentPadding:
                      EdgeInsets.only(left: 16, bottom: 16, right: 16),
                  leading: CircleAvatar(
                    backgroundColor: Color.fromRGBO(169, 145, 73, 1),
                  ),
                );
              },
            )
          ],
        ),
      ),
      endDrawer: const MenuWidget(),
    );
  }
}

class CircleIcon extends StatelessWidget {
  final String iconAsset;
  const CircleIcon({super.key, required this.iconAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(120, 120, 120, 1),
          ),
          shape: BoxShape.circle),
      child: Image.asset(
        iconAsset,
        height: 18,
        width: 18,
      ),
    );
  }
}
