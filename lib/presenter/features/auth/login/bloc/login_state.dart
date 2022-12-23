part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class SuccessLogin extends LoginState {}

class FailureLogin extends LoginState {}
