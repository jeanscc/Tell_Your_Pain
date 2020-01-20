import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tell_your_pain/services/user_management.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  String _email;
  String _nome;
  String _senha;
  String _escolaSelected;
  String _turmaSelected;
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 60,
        child: Image.asset('images/happz.jpg'),
      ),
    );

    final nome = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      onChanged: (value) {
        setState(() {
          _nome = value;
        });
      },
      decoration: InputDecoration(
        hintText: 'Nome',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final senha = TextFormField(
      autofocus: false,
      obscureText: true,
      onChanged: (value) {
        setState(() {
          _senha = value;
        });
      },
      decoration: InputDecoration(
        hintText: 'Senha',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    const _escolas = ["Escola X"];
    const _turmas = ["7° Ano B"];
    _escolaSelected = _escolas[0];
    _turmaSelected = _turmas[0];

    final escola = DropdownButton<String>(
      hint: Text('Seleciona a Escola'),
      isExpanded: true,
      value: _escolaSelected,
      items: _escolas.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (String changedValue) {
        setState(() {
          _escolaSelected = changedValue;
          print(_escolaSelected);
        });
      },
    );

    final turma = DropdownButton<String>(
      hint: Text('Seleciona a turma'),
      isExpanded: true,
      value: _turmaSelected,
      items: _turmas.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (String novoItem) {
        setState(() {
          _turmaSelected = novoItem;
          print(_turmaSelected);
        });
      },
    );

    final botao = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        borderRadius: BorderRadius.circular(32.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            FirebaseAuth.instance
                .createUserWithEmailAndPassword(
              email: _email,
              password: _senha,
            )
                .then((signedInUser) {
              var informacoes =
                  Informacoes(_escolaSelected, _turmaSelected, _nome);
              print(informacoes.nome);
              print(informacoes.escola);
              UserManagement()
                  .storeNewUser(signedInUser.user, context, informacoes);
            });
          },
          color: Colors.blueAccent,
          child: Text(
            'Cadastrar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24, right: 24),
          children: <Widget>[
            logo,
            SizedBox(
              height: 100.0,
              child: Center(
                child: Text(
                  'Cadastre-se',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            nome,
            SizedBox(
              height: 16.0,
            ),
            email,
            SizedBox(
              height: 16.0,
            ),
            senha,
            SizedBox(
              height: 16.0,
            ),
            escola,
            SizedBox(
              height: 24.0,
            ),
            turma,
            SizedBox(
              height: 24.0,
            ),
            botao,
          ],
        ),
      ),
    );
  }
}

class Informacoes {
  String nome;
  String escola;
  String turma;
  Informacoes(this.escola, this.turma, this.nome);
}
