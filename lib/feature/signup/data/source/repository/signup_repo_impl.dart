import 'package:clarity/feature/signup/data/source/remote/signup_remort_source.dart';
import 'package:clarity/feature/signup/domain/repository/signup_repo.dart';

class SignupRepositoryImpl extends SignUpRepository {
  final SignupRemortSource source;

  SignupRepositoryImpl(this.source);
  @override
  Future<void> signup(String email, String password) async {
    await source.signup(email, password);
  }
}
