import 'package:flutter/material.dart';
import 'package:tell_your_pain/pages/avaliacao_page.dart';
import 'package:tell_your_pain/pages/cadastro_page.dart';
import 'package:tell_your_pain/pages/chat_page.dart';
import 'package:tell_your_pain/pages/home_page.dart';
import 'package:tell_your_pain/pages/login_page.dart';
import 'package:tell_your_pain/pages/pergunta_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => new MyApp(),
        '/pages/home_page': (BuildContext context) => new HomePage(),
        '/pages/pergunta_page': (BuildContext context) => new PerguntaPage(),
        '/pages/login_page': (BuildContext context) => new LoginPage(),
        '/pages/avaliacao_page': (BuildContext context) => new AvaliacaoPage(),
        '/pages/cadastro_page': (BuildContext context) => new CadastroPage(),
        '/pages/pergunta_page': (BuildContext context) => new PerguntaPage(),
        '/pages/chat_page': (BuildContext context) => new ChatScreen(),
      },
    );
  }
}
