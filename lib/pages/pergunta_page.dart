import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PerguntaPage extends StatefulWidget {
  @override
  _PerguntaPageState createState() => _PerguntaPageState();
}

class _PerguntaPageState extends State<PerguntaPage> {
  int _index = 0;

  String _perguntaAtual = '';
  final Map _emojis = {
    'emoji1': '',
    'emoji2': '',
    'emoji3': '',
    'emoji4': '',
    'emoji5': ''
  };

  final Map _imgsEmoji = {
    'emoji1': 'images/Triste.png',
    'emoji2': 'images/Chateado.png',
    'emoji3': 'images/Normal.png',
    'emoji4': 'images/Feliz.png',
    'emoji5': 'images/Muito_Feliz.png'
  };

  final _emojisName = [
    'Muito triste',
    'Triste',
    'Normal',
    'Feliz',
    'Muito feliz'
  ];

  final _emojisName2 = ['Muito ruim', 'Ruim', 'Normal', 'Bom', 'Muito bom'];

  final _emojisName3 = [
    'Familia',
    'Amigos',
    'Relacionamento',
    'Escola',
    'Saúde',
  ];

  final Map<String, dynamic> _mapa = {
    'pergunta6': '',
    'pergunta1': '',
    'pergunta2': '',
    'pergunta3': '',
    'pergunta4': '',
    'pergunta5': '',
    'data': Timestamp.now()
  };

  final _perguntas = [
    '1) Como você avalia o cumprimento de suas tarefas hoje?',
    '2) Como você se sentiu fisicamente hoje?',
    '3) Como você se sentiu emocionalmente e mentalmente hoje?',
    '4) Como você avalia seu dia?',
    '5) Escolha uma coisa que contribuiu negativamente para seu dia.',
    '6) Escolha uma coisa que contribuiu positivamente para seu dia.',
  ];
  final _respostas = [
    'Muito triste',
    'Triste',
    'Normal',
    'Feliz',
    'Muito feliz',
  ];

  void _ouvinte(int numero) {
    if (_index == 0 || _index == 1) {
      _mapa['pergunta' + _index.toString()] = _emojisName2[numero];
    } else if (_index == 2 || _index == 3) {
      _mapa['pergunta' + _index.toString()] = _respostas[numero];
    } else {
      _mapa['pergunta' + _index.toString()] = _emojisName3[numero];
    }
    if (_index == 5) {
      _registrarResposta(_mapa);
      Navigator.of(context).pop();
    } else {
      _index += 1;
    }
  }

  void _registrarResposta(Map<String, dynamic> mapa) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('users')
        .document(user.uid)
        .collection('questionarios')
        .add(mapa);
  }

  void _atualizarPergunta() {
    if (_index == 0 || _index == 1) {
      _emojis['emoji1'] = _emojisName2[0];
      _emojis['emoji2'] = _emojisName2[1];
      _emojis['emoji3'] = _emojisName2[2];
      _emojis['emoji4'] = _emojisName2[3];
      _emojis['emoji5'] = _emojisName2[4];
    } else if (_index == 2 || _index == 3) {
      _emojis['emoji1'] = _emojisName[0];
      _emojis['emoji2'] = _emojisName[1];
      _emojis['emoji3'] = _emojisName[2];
      _emojis['emoji4'] = _emojisName[3];
      _emojis['emoji5'] = _emojisName[4];
    } else {
      _imgsEmoji['emoji1'] = 'images/familia.png';
      _imgsEmoji['emoji2'] = 'images/amigos.png';
      _imgsEmoji['emoji3'] = 'images/relacionamento.png';
      _imgsEmoji['emoji4'] = 'images/escola.png';
      _imgsEmoji['emoji5'] = 'images/saude.png';
      _emojis['emoji1'] = _emojisName3[0];
      _emojis['emoji2'] = _emojisName3[1];
      _emojis['emoji3'] = _emojisName3[2];
      _emojis['emoji4'] = _emojisName3[3];
      _emojis['emoji5'] = _emojisName3[4];
    }
    _perguntaAtual = _perguntas[_index];
  }

  @override
  Widget build(BuildContext context) {
    _atualizarPergunta();

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
                _perguntaAtual,
                style: TextStyle(fontSize: 26),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _ouvinte(0);

                        setState(() {
                          _atualizarPergunta();
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 10),
                        child: Image.asset(
                          _imgsEmoji['emoji1'],
                          height: MediaQuery.of(context).size.width / 10,
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 10,
                            top: MediaQuery.of(context).size.width / 80),
                        child: Text(
                          _emojis['emoji1'],
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 35),
                        )),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _ouvinte(1);

                        setState(() {
                          _atualizarPergunta();
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 18),
                        child: Image.asset(
                          _imgsEmoji['emoji2'],
                          height: MediaQuery.of(context).size.width / 10,
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 80,
                            left: MediaQuery.of(context).size.width / 18),
                        child: Text(
                          _emojis['emoji2'],
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 35),
                        )),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      child: InkWell(
                        onTap: () {
                          _ouvinte(2);
                          setState(() {
                            _atualizarPergunta();
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 18),
                          child: Image.asset(
                            _imgsEmoji['emoji3'],
                            height: MediaQuery.of(context).size.width / 10,
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 80,
                            left: MediaQuery.of(context).size.width / 18),
                        child: Text(
                          _emojis['emoji3'],
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 35),
                        )),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _ouvinte(3);
                        setState(() {
                          _atualizarPergunta();
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 18),
                        child: Image.asset(
                          _imgsEmoji['emoji4'],
                          height: MediaQuery.of(context).size.width / 10,
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 80,
                            left: MediaQuery.of(context).size.width / 18),
                        child: Text(
                          _emojis['emoji4'],
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 35),
                        )),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _ouvinte(4);
                        setState(() {
                          _atualizarPergunta();
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 20),
                        child: Image.asset(
                          _imgsEmoji['emoji5'],
                          height: MediaQuery.of(context).size.width / 10,
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 80,
                            left: MediaQuery.of(context).size.width / 20),
                        child: Text(
                          _emojis['emoji5'],
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 35),
                        )),
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
