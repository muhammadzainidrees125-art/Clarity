import 'package:clarity/feature/signup/data/source/remote/signup_remort_source.dart';
import 'package:clarity/feature/signup/data/source/repository/signup_repo_impl.dart';
import 'package:clarity/feature/signup/domain/usecase/signup_usecase.dart';
import 'package:clarity/feature/signup/view/screen/signup_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> register() async {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      print(
        'fullname: ${fullNameController.text},email:$email,password:$password,confirmpassword:$confirmPassword',
      );

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

    try {
      await SignUpUseCase(
        SignupRepositoryImpl(SignupRemoteImpl()),
      ).call(email, password);

      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      String errorMessage = _getFirebaseErrorMessage(e.code);
      emit(SignupError(errorMessage));
    } catch (e) {
      emit(SignupError('An error occurred: $e'));
    }
  }

  String _getFirebaseErrorMessage(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already registered. Please sign in or use a different email.';
      case 'weak-password':
        return 'The password is too weak. Please use a stronger password.';
      case 'invalid-email':
        return 'The email address is invalid. Please enter a valid email.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled. Please contact support.';
      case 'too-many-requests':
        return 'Too many signup attempts. Please try again later.';
      default:
        return 'Signup failed: $code. Please try again.';
    }
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
