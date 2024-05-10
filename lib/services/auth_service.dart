import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> signIn(String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
    } else if (e.code == 'wrong-password') {
    }
    throw Exception('Sign in failed');
  }
}
