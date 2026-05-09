import 'package:clarity/feature/signin/data/repository/signin_repo_impl.dart';
import 'package:clarity/feature/signin/data/source/remote/signin_remote_source.dart';
import 'package:clarity/feature/signin/domain/usecase/signin_usecase.dart';
import 'package:clarity/feature/signin/view/screen/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  /// CONTROLLERS

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  /// TOGGLE PASSWORD VISIBILITY

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(SigninPasswordToggle(isPasswordVisible));
    // Ensure state is emitted even if value hasn't changed
    if (state is! SigninPasswordToggle) {
      emit(SigninPasswordToggle(isPasswordVisible));
    }
  }

  /// LOGIN FUNCTION

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    /// VALIDATION
    if (email.isEmpty || password.isEmpty) {
      emit(SigninError('All fields are required'));
      return;
    }

    if (!email.contains('@')) {
      emit(SigninError('Enter valid email'));
      return;
    }

    if (password.length < 6) {
      emit(SigninError('Password must be 6 characters'));
      return;
    }

    /// LOADING
    emit(SigninLoading());

    try {
      /// API CALL (UseCase)
      await SignInUseCase(
        SignInRepositoryImpl(SignInRemoteImpl()),
      ).call(email, password);

      /// SUCCESS
      emit(SigninSuccess());
    } catch (e) {
      /// ERROR
      emit(SigninError(e.toString()));
    }
  }

  /// DISPOSE CONTROLLERS

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();

    return super.close();
  }
}
