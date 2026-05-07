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

  void login() {
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

    /// API CALL

    Future.delayed(Duration(seconds: 2), () {
      emit(SigninSuccess());
    });
  }

  /// DISPOSE CONTROLLERS

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();

    return super.close();
  }
}
