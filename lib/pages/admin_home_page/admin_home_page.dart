import 'package:flutter/material.dart';

import 'package:tell_your_pain/pages/admin_home_page/admin_card.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HAppy'),
      ),
      backgroundColor: Color(0xFFF0F0F0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/icones_home/home.png',
                width: 40,
                height: 40,
              ),
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/icones_home/historico.png',
                width: 40,
                height: 40,
              ),
              title: Text('Histórico')),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/icones_home/user.png',
                width: 40,
                height: 40,
              ),
              title: Text('Perfil')),
        ],
      ),
      body: getBody(),
    );
  }

  getBody() {
    return (_currentIndex == 0) ? AdminCard() : Container();
  }
}
