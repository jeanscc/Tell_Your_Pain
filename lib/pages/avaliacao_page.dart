import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AvaliacaoPage extends StatelessWidget {
  final _respostas = [
    'Muito triste',
    'Triste',
    'Normal',
    'Feliz',
    'Muito feliz',
  ];

  void _registrar(int index) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('users')
        .document(user.uid)
        .collection('avaliacoes')
        .add({'resposta': _respostas[index], 'data': Timestamp.now()});
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: MediaQuery.of(context).size.width / 3,
        child: Image.asset('images/happz.jpg'),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            logo,
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 11),
              child: Text(
                'De uma maneira geral, Como você está se sentindo hoje?',
                style: TextStyle(fontSize: 26),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _registrar(0);
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 8.5),
                    child: Image.asset(
                      'images/Triste.png',
                      height: MediaQuery.of(context).size.width / 10,
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _registrar(1);
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 16),
                    child: Image.asset(
                      'images/Chateado.png',
                      height: MediaQuery.of(context).size.width / 10,
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _registrar(2);
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 16),
                    child: Image.asset(
                      'images/Normal.png',
                      height: MediaQuery.of(context).size.width / 10,
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _registrar(3);
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 16),
                    child: Image.asset(
                      'images/Feliz.png',
                      height: MediaQuery.of(context).size.width / 10,
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _registrar(4);
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 16),
                    child: Image.asset(
                      'images/Muito_Feliz.png',
                      height: MediaQuery.of(context).size.width / 10,
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
