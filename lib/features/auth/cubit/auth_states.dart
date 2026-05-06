abstract class AuthState {}

class LoginInitialState extends AuthState {}
class LoginLoadingState extends AuthState {}
class LoginSuccessState extends AuthState {
  final String successMessage;

  LoginSuccessState(this.successMessage);
}
class LoginErrorState extends AuthState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}
class SignupInitialState extends AuthState {}
class SignupLoadingState extends AuthState {}
class SignupSuccessState extends AuthState {
  final String successMessage;

  SignupSuccessState(this.successMessage);
}
class SignupErrorState extends AuthState {
  final String errorMessage;

  SignupErrorState(this.errorMessage);
}