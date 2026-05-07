import 'package:clarity/feature/signup/view/screen/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register() {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      emit(SignupError('All fields are required'));
      return;
    }

    if (!email.contains('@')) {
      emit(SignupError('Enter a valid email'));
      return;
    }

    if (password.length < 6) {
      emit(SignupError('Password must be at least 6 characters'));
      return;
    }

    if (password != confirmPassword) {
      emit(SignupError('Passwords do not match'));
      return;
    }

    emit(SignupLoading());

    Future.delayed(Duration(seconds: 2), () {
      emit(SignupSuccess());
    });
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
