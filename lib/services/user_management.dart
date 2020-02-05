import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

class UserManagement {
  storeNewUser(user, context, informacoes) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    StorageUploadTask task =
        FirebaseStorage.instance.ref().child(user.uid).putFile(informacoes.img);
    var dowurl = await (await task.onComplete).ref.getDownloadURL();
    String url = dowurl.toString();
    Firestore.instance.collection('users').document(user.uid).setData({
      'email': user.email,
      'uid': user.uid,
      'nome': informacoes.nome,
      'escola': informacoes.escola,
      'imgUrl': url,
      'turma': 'F4RVf2v1vivekFl7APHr',
    }).then((value) {
      Navigator.of(context).pushReplacementNamed('/pages/login_page');
    }).catchError((e) {
      print(e);
    });
  }
}
