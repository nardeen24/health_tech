abstract class AuthState {}

class LoginInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final String userName;
  final String successMessage;

  LoginSuccessState(this.successMessage, this.userName);
}

class LoginErrorState extends AuthState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}

class SignupInitialState extends AuthState {}

class SignupLoadingState extends AuthState {}

class SignupSuccessState extends AuthState {
  final String userName;
  final String successMessage;

  SignupSuccessState(this.successMessage, this.userName);
}

class SignupErrorState extends AuthState {
  final String errorMessage;

  SignupErrorState(this.errorMessage);
}
