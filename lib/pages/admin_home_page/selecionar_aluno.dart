import 'package:flutter/material.dart';
import 'package:tell_your_pain/pages/admin_home_page/aluno_elemento.dart';

class SelecionarAluno extends StatelessWidget {
  List lista;
  SelecionarAluno(this.lista);

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

    return Scaffold(
        body: Column(children: <Widget>[
      logo,
      SizedBox(
        height: MediaQuery.of(context).size.height / 14,
      ),
      Expanded(child: ElementoAluno(lista))
    ]));
  }
}
