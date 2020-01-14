import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  var textos = [
    "Questionário Diário",
    "Avaliação Do Dia",
    "Chat Da Turma",
    "Deslogar"
  ];
  var images = [
    'images/icones_home/questionario.png',
    'images/icones_home/estado.png',
    'images/icones_home/chat.png',
    'images/icones_home/deslogar.png'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: textos.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 2.6),
      ),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Image.asset(
                images[index],
                width: 40,
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  textos[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
