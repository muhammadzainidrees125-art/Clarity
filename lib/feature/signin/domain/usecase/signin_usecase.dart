import 'package:clarity/feature/signin/domain/repository/signin_repo.dart';

class SignInUseCase {
  final SignInRepository repository;

  SignInUseCase(this.repository);

  Future<void> call(String email, String password) async {
    await repository.signIn(email, password);
  }
}
