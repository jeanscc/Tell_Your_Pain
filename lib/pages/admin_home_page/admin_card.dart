import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tell_your_pain/pages/admin_home_page/selecionar_aluno.dart';
import 'package:tell_your_pain/services/aluno_management.dart';

class AdminCard extends StatelessWidget {
  List lista;

  var textos = ["Relatório de alunos", "Relatório da turma", "Sair"];
  var images = [
    'images/icones_home/questionario.png',
    'images/icones_home/questionario.png',
    'images/icones_home/deslogar.png',
    'images/icones_home/deslogar.png'
  ];

  Future<List> retornarLista() async {
    var variavel = await AlunoManagement().recuperarAlunos();
    return variavel;
  }

  retornar() async {
    await retornarLista().then((valor) {
      lista = valor;
    });
  }

  click(int index, context) async {
    await retornar();

    if (index == 0) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SelecionarAluno(lista)));
    } else if (index == 1) {
      Navigator.of(context).pushNamed('/pages/admin_home_page/listagem_turma');
    } else if (index == 2) {
      FirebaseAuth.instance.signOut().then((user) {
        exit(0);
      });
    }
  }

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
          child: InkWell(
            onTap: () {
              click(index, context);
            },
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
                  padding: const EdgeInsets.all(6),
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
          ),
        );
      },
    );
  }
}
