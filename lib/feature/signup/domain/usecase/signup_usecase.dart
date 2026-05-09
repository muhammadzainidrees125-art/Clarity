import 'package:clarity/feature/signup/domain/repository/signup_repo.dart';

class SignUpUseCase {
  final SignUpRepository repository;

  SignUpUseCase(this.repository);

  Future<void> call(String email, String password) async {
    await repository.signup(email, password);
  }
}
