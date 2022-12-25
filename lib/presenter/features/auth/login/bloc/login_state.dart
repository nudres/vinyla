part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class SuccessLogin extends LoginState {}

class FailureTypeLogin extends LoginState {
  FailureTypeLogin(this.type);

  final BaseExceptionType type;
}

class FailureMessageLogin extends LoginState {
  FailureMessageLogin(this.message);

  final String message;
}
