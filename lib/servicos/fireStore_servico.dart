import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_financeiro/modelos/lista_modelos.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireSoreServico {
  String userId;
  FireSoreServico() : userId = FirebaseAuth.instance.currentUser!.uid;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> adicionarDespesas(AdicionarModelo adicionarModelo) async {
    return await _firestore
        .collection(userId)
        .doc(adicionarModelo.id)
        .set(adicionarModelo.toMap());
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> conectarStreamDespesas() {
    return _firestore.collection(userId).snapshots();
  }
}