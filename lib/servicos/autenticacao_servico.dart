import 'package:firebase_auth/firebase_auth.dart';
class AutenticacaoServico{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario ({
    required String nome,
    required String email,
    required String senha,
  }) async {
    try {
      UserCredential userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha
      );
      await userCredencial.user!.updateDisplayName(nome);

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'E-mail ja cadastrado';
      }
      return 'erro desconhecido';
    }
  }
  Future<String?> logarUsuario ({required String email, required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return 'E-mail não cadastrado';
      }
      return 'erro desconhecido';
    }
  }
  Future<void> deslogarUsuario() async {
    await _firebaseAuth.signOut();
  }
}