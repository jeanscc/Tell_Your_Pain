import 'package:flutter/material.dart';
import 'package:tell_your_pain/services/turma_management.dart';

class ListagemTurma extends StatefulWidget {
  @override
  _ListagemTurmaState createState() => _ListagemTurmaState();
}

class _ListagemTurmaState extends State<ListagemTurma> {
  Map mapa;

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: MediaQuery.of(context).size.width / 3,
        child: Image.asset('images/happz.jpg'),
      ),
    );
    return FutureBuilder(
        future: TurmaManagement().mediaTurma(),
        builder: (BuildContext context, AsyncSnapshot shot) {
          return shot.hasData
              ? Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: ListView(children: <Widget>[
                      Column(
                        children: <Widget>[
                          logo,
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 25,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Escola X',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Turma: 7° Ano B Tarde',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Período: Total',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Estatísticas',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Questionários diários respondidos:' +
                                        shot.data['Qrespondidos'].toString(),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Avaliações diárias respondidas:' +
                                        shot.data['Arespondidos'].toString(),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Dias críticos: ' +
                                        shot.data['criticos'].toString(),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Dias Positivos: ' +
                                        shot.data['positivos'].toString(),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Dias Negativos: ' +
                                        shot.data['negativos'].toString(),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Médias',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Pergunta 1 : ' + shot.data['media1'],
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Pergunta 2: ' + shot.data['media2'],
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Pergunta 3: ' + shot.data['media3'],
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Pergunta 4: ' + shot.data['media4'],
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Pergunta 5: ' + shot.data['media5'],
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          8.5),
                                  child: Text(
                                    'Pergunta 6: ' + shot.data['media6'],
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                        ],
                      ),
                    ]),
                  ),
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}
