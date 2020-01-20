import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class UserManagement {
  storeNewUser(user, context, informacoes) {
    print(user.email);
    Firestore.instance.collection('users').document(user.uid).setData({
      'email': user.email,
      'uid': user.uid,
      'nome': informacoes.nome,
      'escola': informacoes.escola,
      'turma': 'F4RVf2v1vivekFl7APHr',
    }).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/pages/login_page');
    }).catchError((e) {
      print(e);
    });
  }
}
