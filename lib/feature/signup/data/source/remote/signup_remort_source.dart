import 'package:firebase_auth/firebase_auth.dart';

abstract interface class SignupRemortSource {
  Future<void> signup(String email, String password);
}

class SignupRemoteImpl extends SignupRemortSource {
  // ignore: non_constant_identifier_names
  final FirebaseAuth_auth = FirebaseAuth.instance;

  @override
  Future<void> signup(String email, String pasdword) async {
    await FirebaseAuth_auth.signInWithEmailAndPassword(
      email: email,
      password: pasdword,
    );
  }
}
