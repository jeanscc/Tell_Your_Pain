import 'package:flutter/material.dart';
import 'package:tell_your_pain/pages/admin_home_page/listagem_aluno.dart';
import 'package:tell_your_pain/services/aluno_management.dart';

class ElementoAluno extends StatelessWidget {
  List widgets = [];
  BuildContext _context;
  List uids = [];
  List nomes = [];

  ElementoAluno(List lista) {
    for (Map i in lista) {
      final linha = Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(i['foto']),
            backgroundColor: Colors.transparent,
            radius: 20,
          ),
          Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(i['nome'], style: TextStyle(fontSize: 18)))
        ],
      );
      widgets.add(linha);
      uids.add(i['uid']);
      nomes.add(i['nome']);
    }
  }

  ouvinte(BuildContext context, index) async {
    AlunoManagement.nome = nomes[index];
    AlunoManagement.uid = uids[index];

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ListagemAluno()));
  }

  Widget _buildAlunos(BuildContext context, int index) {
    return InkWell(
        onTap: () {
          ouvinte(context, index);
        },
        child: widgets[index]);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return ListView.builder(
      itemBuilder: _buildAlunos,
      itemCount: widgets.length,
    );
  }
}
