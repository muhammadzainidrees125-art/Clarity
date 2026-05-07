abstract class SigninState {}

class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {}

class SigninError extends SigninState {
  final String message;

  SigninError(this.message);
}

class SigninPasswordToggle extends SigninState {
  final bool isVisible;

  SigninPasswordToggle(this.isVisible);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SigninPasswordToggle &&
          runtimeType == other.runtimeType &&
          isVisible == other.isVisible;

  @override
  int get hashCode => isVisible.hashCode;
}
