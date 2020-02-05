import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tell_your_pain/services/user_management.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  bool _check = false;
  File _imgFile;
  String _url;
  String _email;
  String _nome;
  String _senha;
  String _escolaSelected;
  String _turmaSelected;
  String _valorData;

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (picked != null) setState(() => _valorData = picked.toString());
  }

  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 60,
        child: Image.asset('images/happz.jpg'),
      ),
    );

    final foto = IconButton(
      icon: Icon(Icons.photo_camera),
      iconSize: 50,
      onPressed: () async {
        _imgFile = await ImagePicker.pickImage(
            source: ImageSource.gallery, maxHeight: 250, maxWidth: 250);
      },
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

    final okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    final alerta = AlertDialog(
      title: Text("Termos de Uso"),
      content: SingleChildScrollView(
        child: Text(
            "TERMO DE RESPONSABILIDADE DE USO DO APLICATIVO hAppy\n 1. Ao acessar o aplicativo para smartphones da hAppy, você concorda automaticamente com os termos e condições de utilização dos recursos oferecidos e seu funcionamento descrito na Política de Privacidade, a qual recomendamos a leitura antes da utilização. \n2. As áreas de acesso com login e senha são restritas às pessoas previamente cadastradas. Cada usuário autorizado é responsável por seus dados (login e senha) e pela segurança dos mesmos. \n3. Seus dados de acesso (login e senha) são pessoais e intransferíveis, bem como de inteira responsabilidade do usuário, e a hAppy não se responsabiliza pelo seu uso indevido. \n4. Marcas, nomes comerciais e conteúdos oferecidos de qualquer espécie que estão veículados ao aplicativo da hAppy são de propriedade da empresa e não podem ser reproduzidos sem prévia autorização e respectiva titularidade. \n5. O usuário paciente declaram ter expresso conhecimento de que a hAppy é uma empresa intermediadora entre o usuário aluno e os usuários profissionais da escola, não se responsabilizando, de forma alguma, pela atividade do profissional da escola específica, nem tendo qualquer poder de intervenção sobre o usuário profissional da escola e o usuário aluno, estando isenta de qualquer responsabilidade por quaisquer atos advindos desta relação. \n6. As partes usuárias declaram terem conhecimento de que é de inteira responsabilidade dos usuários profissionais da escola manter a regularidade do cadastro de seus funcionários específicos a que estiver submetido, isentando a hAppy de quaisquer situações daí advindas. \n7. Os usuários dos serviços hAppy declara serem verídicas as informações por ele prestadas em seu cadastro.\n8. O usuário declara ter conhecimento de que o hAppy busca manter todas as informações contidas em seu aplicativo devidamente atualizadas. Porém, em função do ambiente da Internet, não pode garantir que o acesso ao aplicativo seja livre de erros e/ou problemas decorrente de casos fortuitos, internos ou externos, casos de força maior ou ainda de outros casos não inteiramente sujeitos a controle direto dos administradores do aplicativo, razão pela qual a hAppy é isenta de qualquer responsabilidade pela exatidão das informações divulgadas. \n9. A hAppy não poderá ser responsabilizada, em nenhum caso, por quaisquer danos diretos, indiretos, casuais e especiais relacionados ou derivados deste aplicativo ou de seu uso, ou de qualquer site, recurso ou aplicativo vinculado, informação referenciada ou acessada por meio deste aplicativo, ou por uso ou download, ou acesso a quaisquer materiais, informações, produtos e serviços, incluindo, sem limitação, incluindo outros dados. Esta exclusão e renúncia de responsabilidade se aplicam a todas as causas de ação.\n10. A hAppy se reserva o direito de alterar os termos e condições, bem como os conteúdos do aplicativo, a qualquer momento, sem aviso prévio. \n11. Os usuários declaram ter pleno conhecimento de que o seu cadastro na hAppy não cria com ela vínculo empregatício, societário e/ou qualquer outro de qualquer natureza. \n12. O usuário declara ter conhecimento de que a hAppy pode solicitar, a qualquer momento o fornecimento de informações específicas quanto ao seu cadastro, haja vista a política de segurança adotada, objetivando resguardar a segurança dos usuários e clientes. \n13. O uso indevido do aplicativo, exemplificadamente, o fornecimento de dados incorretos e/ou inverídicos ou qualquer outro uso que vá contra às finalidades da hAppy, bem como às suas políticas de privacidade e segurança, garante o direito desta de terminar e/ou proibir, a seu critério e sem prévia consulta, o acesso do usuário. \n14. Em caso de dúvidas sobre este termo, sobre a política de privacidade e/ou segurança do site e aplicativo, favor contatar-nos em um dos nossos canais de atendimento. "),
      ),
      actions: [
        okButton,
      ],
    );

    final nascimento = InkWell(
      onTap: () {
        _selectDate(); // Call Function that has showDatePicker()
      },
      child: IgnorePointer(
        child: TextFormField(
          decoration: InputDecoration(hintText: '    Data de nascimento'),
          maxLength: 10,
          // validator: validateDob,
          onSaved: (String val) {
            
          },
        ),
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
                .createUserWithEmailAndPassword(
              email: _email,
              password: _senha,
            )
                .then((signedInUser) async {
              var informacoes =
                  Informacoes(_escolaSelected, _turmaSelected, _nome, _imgFile);

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
            foto,
            nome,
            SizedBox(
              height: 16.0,
            ),
            nascimento,
            email,
            SizedBox(
              height: 16.0,
            ),
            senha,
            SizedBox(
              height: 16.0,
            ),
            Padding(padding: EdgeInsets.only(left: 10), child: escola),
            SizedBox(
              height: 24.0,
            ),
            Padding(padding: EdgeInsets.only(left: 10), child: turma),
            SizedBox(
              height: 1.0,
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _check,
                  onChanged: (boo) {
                    if (_check) {
                      _check = false;
                    } else {
                      _check = true;
                    }
                    setState(() {
                      _check;
                    });
                  },
                  hoverColor: Colors.blue,
                ),
                Text('Aceito os',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 22)),
                FlatButton(
                  child: Text('termos de uso',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: MediaQuery.of(context).size.width / 21)),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alerta;
                        });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 1.0,
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
  File img;
  Informacoes(this.escola, this.turma, this.nome, this.img);
}
