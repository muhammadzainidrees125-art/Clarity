import 'package:clarity/feature/signin/data/source/remote/signin_remote_source.dart';
import 'package:clarity/feature/signin/domain/repository/signin_repo.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInRemoteSource source;

  SignInRepositoryImpl(this.source);

  @override
  Future<void> signIn(String email, String password) async {
    await source.signIn(email, password);
    //
  }
}
