class AuthState {}

final class AuthInitial extends AuthState {}

final class SignupLoadingState extends AuthState {}

final class SignupSuccessState extends AuthState {}

final class SignupFailureState extends AuthState {
  final String errMessage;

  SignupFailureState({required this.errMessage});
}

//!

class CreateUserLoadingState extends AuthState {}

class CreateUserSuccessState extends AuthState {}

class CreateUserErrorState extends AuthState {
  late final String error;
  CreateUserErrorState(this.error);
}

////////////////////////////////////////////////////////
// Login
class LoginInUserLoadingState extends AuthState {}

class LoginInUserSuccessState extends AuthState {
  late final String uid;
  LoginInUserSuccessState(this.uid);
}

class LoginInUserErrorState extends AuthState {
  late final String error;
  LoginInUserErrorState(this.error);
}

final class TermsAndConditionUpdateState extends AuthState {}

final class ObscurePasswordTextUpdateState extends AuthState {}
