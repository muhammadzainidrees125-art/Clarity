import 'package:firebase_auth/firebase_auth.dart';

abstract interface class SignupRemortSource {
  Future<void> signup(String email, String password);
}

class SignupRemoteImpl implements SignupRemortSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> signup(String email, String password) async {
    try {
      print("🔥 Signup started");

      print("📧 Email: $email");

      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("✅ Signup successful");
      print("👤 User ID: ${result.user?.uid}");
    } catch (e) {
      print("❌ Signup failed");
      print("Error: $e");

      rethrow;
    }
  }
}
