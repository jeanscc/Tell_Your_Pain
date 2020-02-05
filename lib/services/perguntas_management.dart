import 'package:cloud_firestore/cloud_firestore.dart';

class PerguntasManagement {
  static Map mapa;

  final _name = ['Muito triste', 'Triste', 'Normal', 'Feliz', 'Muito feliz'];

  final _name2 = ['Muito ruim', 'Ruim', 'Normal', 'Bom', 'Muito bom'];

  final _name3 = [
    'Familia',
    'Amigos',
    'Relacionamento',
    'Escola',
    'Saúde',
  ];

  Map perguntas = {
    'pergunta1': '1) Como você avalia o cumprimento de suas tarefas hoje?',
    'pergunta2': '2) Como você se sentiu fisicamente hoje?',
    'pergunta3': '3) Como você se sentiu emocionalmente e mentalmente hoje?',
    'pergunta4': '4) Como você avalia seu dia',
    'pergunta5':
        '5) Escolha uma coisa que contribuiu negativamente para seu dia.',
    'pergunta6':
        '6) Escolha uma coisa que contribuiu positivamente para seu dia.',
  };
  Map respostas = {
    'resposta1': 'Muito triste',
    'resposta2': 'Triste',
    'resposta3': 'Normal',
    'resposta4': 'Feliz',
    'resposta5': 'Muito feliz',
  };

  registrarRespostas() {}

  registrarAvaliacao() {}

  recuperarEstatisticas(String uid) async {
    List cont1 = [0, 0, 0, 0, 0];
    List cont2 = [0, 0, 0, 0, 0];
    List cont3 = [0, 0, 0, 0, 0];
    List cont4 = [0, 0, 0, 0, 0];
    List cont5 = [0, 0, 0, 0, 0];
    List cont6 = [0, 0, 0, 0, 0];

    Map mapa = {
      'Qrespondidos': 0,
      'Arespondidos': 0,
      'criticos': 0,
      'positivos': 0,
      'negativos': 0,
      'normais': 0,
      'media1': 0,
      'media2': 0,
      'media3': 0,
      'media4': 0,
      'media5': 0,
      'media6': 0,
    };

    QuerySnapshot questionarios = await Firestore.instance
        .collection('users')
        .document(uid)
        .collection('questionarios')
        .getDocuments();

    QuerySnapshot avaliacoes = await Firestore.instance
        .collection('users')
        .document(uid)
        .collection('avaliacoes')
        .getDocuments();

    mapa['Qrespondidos'] = questionarios.documents.length;
    mapa['Arespondidos'] = avaliacoes.documents.length;
    for (DocumentSnapshot doc in avaliacoes.documents) {
      if (doc.data['resposta'] == 'Muito triste') {
        mapa['criticos'] += 1;
      } else if (doc.data['resposta'] == 'Triste') {
        mapa['negativos'] += 1;
      } else {
        mapa['positivos'] += 1;
      }
    }
    if (mapa['Qrespondidos'] == 0) {
      mapa['media1'] = 'Sem questionários respondidos';
      mapa['media2'] = 'Sem questionários respondidos';
      mapa['media3'] = 'Sem questionários respondidos';
      mapa['media4'] = 'Sem questionários respondidos';
      mapa['media5'] = 'Sem questionários respondidos';
      mapa['media6'] = 'Sem questionários respondidos';
    } else {
      for (DocumentSnapshot doc in questionarios.documents) {
        if (doc.data['pergunta0'] == 'Muito ruim') {
          cont1[0] += 1;
        } else if (doc.data['pergunta0'] == 'Ruim') {
          cont1[1] += 1;
        } else if (doc.data['pergunta0'] == 'Normal') {
          cont1[2] += 1;
        } else if (doc.data['pergunta0'] == 'Bom') {
          cont1[3] += 1;
        } else if (doc.data['pergunta0'] == 'Muito bom') {
          cont1[4] += 1;
        }

        if (doc.data['pergunta1'] == 'Muito ruim') {
          cont2[0] += 1;
        } else if (doc.data['pergunta1'] == 'Ruim') {
          cont2[1] += 1;
        } else if (doc.data['pergunta1'] == 'Normal') {
          cont2[2] += 1;
        } else if (doc.data['pergunta1'] == 'Bom') {
          cont2[3] += 1;
        } else if (doc.data['pergunta1'] == 'Muito bom') {
          cont2[4] += 1;
        }

        if (doc.data['pergunta2'] == 'Muito triste') {
          cont3[0] += 1;
        } else if (doc.data['pergunta2'] == 'Triste') {
          cont3[1] += 1;
        } else if (doc.data['pergunta2'] == 'Normal') {
          cont3[2] += 1;
        } else if (doc.data['pergunta2'] == 'Feliz') {
          cont3[3] += 1;
        } else if (doc.data['pergunta2'] == 'Muito feliz') {
          cont3[4] += 1;
        }

        if (doc.data['pergunta3'] == 'Muito triste') {
          cont4[0] += 1;
        } else if (doc.data['pergunta3'] == 'Triste') {
          cont4[1] += 1;
        } else if (doc.data['pergunta3'] == 'Normal') {
          cont4[2] += 1;
        } else if (doc.data['pergunta3'] == 'Feliz') {
          cont4[3] += 1;
        } else if (doc.data['pergunta3'] == 'Muito feliz') {
          cont4[4] += 1;
        }

        if (doc.data['pergunta4'] == 'Familia') {
          cont5[0] += 1;
        } else if (doc.data['pergunta4'] == 'Amigos') {
          cont5[1] += 1;
        } else if (doc.data['pergunta4'] == 'Relacionamento') {
          cont5[2] += 1;
        } else if (doc.data['pergunta4'] == 'Escola') {
          cont5[3] += 1;
        } else if (doc.data['pergunta4'] == 'Saúde') {
          cont5[4] += 1;
        }

        if (doc.data['pergunta5'] == 'Familia') {
          cont6[0] += 1;
        } else if (doc.data['pergunta5'] == 'Amigos') {
          cont6[1] += 1;
        } else if (doc.data['pergunta5'] == 'Relacionamento') {
          cont6[2] += 1;
        } else if (doc.data['pergunta5'] == 'Escola') {
          cont6[3] += 1;
        } else if (doc.data['pergunta5'] == 'Saúde') {
          cont6[4] += 1;
        }
      }

      int maior1 = 0;
      int maior2 = 0;
      int maior3 = 0;
      int maior4 = 0;
      int maior5 = 0;
      int maior6 = 0;
      int index1 = 0;
      int index2 = 0;
      int index3 = 0;
      int index4 = 0;
      int index5 = 0;
      int index6 = 0;

      for (var i = 0; i < cont1.length; i++) {
        if (cont1[i] > maior1) {
          maior1 = cont1[i];
          index1 = i;
        }
        if (cont2[i] > maior2) {
          maior2 = cont2[i];
          index2 = i;
        }
        if (cont3[i] > maior3) {
          maior3 = cont3[i];
          index3 = i;
        }
        if (cont4[i] > maior4) {
          maior4 = cont4[i];
          index4 = i;
        }
        if (cont5[i] > maior5) {
          maior5 = cont5[i];
          index5 = i;
        }
        if (cont6[i] > maior6) {
          maior6 = cont6[i];
          index6 = i;
        }
      }

      mapa['media1'] = _name2[index1];
      mapa['media2'] = _name2[index2];
      mapa['media3'] = _name[index3];
      mapa['media4'] = _name[index4];
      mapa['media5'] = _name3[index5];
      mapa['media6'] = _name3[index6];
    }
    PerguntasManagement.mapa = mapa;
    return mapa;
  }
}
