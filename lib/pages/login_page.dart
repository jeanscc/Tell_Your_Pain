import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _senha;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 60,
        child: Image.asset('images/happz.jpg'),
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
                .signInWithEmailAndPassword(
              email: _email,
              password: _senha,
            )
                .then((user) {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/pages/home_page');
            }).catchError((e) {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('Email ou Senha Inválido'),
              ));
            });
          },
          color: Colors.blueAccent,
          child: Text(
            'Log in',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

    final cadastrar = FlatButton(
      child: Text(
        'Não tem uma conta? Cadastre-se',
        style: TextStyle(color: Colors.blue, fontSize: 16),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/pages/cadastro_page');
      },
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24, right: 24),
          children: <Widget>[
            logo,
            SizedBox(
              height: 48.0,
            ),
            email,
            SizedBox(
              height: 8.0,
            ),
            senha,
            SizedBox(
              height: 24.0,
            ),
            botao,
            cadastrar
          ],
        ),
      ),
    );
  }
}
