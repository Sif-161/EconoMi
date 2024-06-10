import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AutenticacaoServico{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario ({
    required String nome,
    required String email,
    required String senha,
  }) async {
    try {
      UserCredential userCredencial = await firebaseAuth.createUserWithEmailAndPassword(
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
      await firebaseAuth.signInWithEmailAndPassword(
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
    await firebaseAuth.signOut();
  }
  Future<User?> signInWithGoogle() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }
}

