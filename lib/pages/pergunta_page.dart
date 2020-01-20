import 'package:flutter/material.dart';

class PerguntaPage extends StatefulWidget {
  @override
  _PerguntaPageState createState() => _PerguntaPageState();
}

class _PerguntaPageState extends State<PerguntaPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 120,
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
              height: 100.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 45),
              child: Text(
                'De uma maneira geral, Como você está se sentindo hoje?',
                style: TextStyle(fontSize: 26),
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Image.asset(
                        'images/Triste.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Text('Triste')),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Image.asset(
                        'images/Chateado.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text('Chateado')),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Image.asset(
                        'images/Normal.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text('Triste')),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Image.asset(
                        'images/Feliz.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text('Feliz')),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Image.asset(
                        'images/Muito Feliz.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text('Muito Feliz')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
