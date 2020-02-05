import 'package:cloud_firestore/cloud_firestore.dart';

class AlunoManagement {
  static String uid;
  static String nome;

  recuperarAlunos() async {
    QuerySnapshot query =
        await Firestore.instance.collection('users').getDocuments();
    List documentos = [];
    for (DocumentSnapshot i in query.documents) {
      Map mapa = {
        'nome': i.data['nome'],
        'uid': i.data['uid'],
        'foto': i.data['imgUrl']
      };
      documentos.add(mapa);
    }
    return documentos;
  }

  static retornarListagem() {}
}
