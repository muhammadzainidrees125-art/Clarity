import 'package:firebase_auth/firebase_auth.dart';

abstract interface class SignInRemoteSource {
  Future<void> signIn(String email, String password);
  Future<void> forgotPassword(String email);
}

class SignInRemoteImpl extends SignInRemoteSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
