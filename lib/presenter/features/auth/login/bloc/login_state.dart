part of 'login_cubit.dart';

enum PhoneStep {
  phone,
  verify,
}

enum AuthType {
  phone,
  credential,
}

@immutable
class LoginState {
  final AuthType authType;
  final PhoneStep phoneStep;

  const LoginState({
    this.authType = AuthType.phone,
    this.phoneStep = PhoneStep.phone,
  });

  LoginState copyWith({
    AuthType? authType,
    PhoneStep? phoneStep,
  }) {
    return LoginState(
      authType: authType ?? this.authType,
      phoneStep: phoneStep ?? this.phoneStep,
    );
  }
}

class AuthorizedState extends LoginState {
  const AuthorizedState({
    super.authType = AuthType.phone,
    super.phoneStep = PhoneStep.phone,
  });
}

class FailureMessageLogin extends LoginState {
  const FailureMessageLogin(
    this.type, {
    this.message,
    super.authType = AuthType.phone,
    super.phoneStep = PhoneStep.phone,
  });

  final String? message;
  final BaseExceptionType? type;
}
