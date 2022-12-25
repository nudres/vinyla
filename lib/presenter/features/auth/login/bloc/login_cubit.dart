import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:vinyla/domain/domain.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._loginCredentialUseCase,
    this._loginPhoneUseCase,
    this._verifyPhoneUseCase,
  ) : super(const LoginState());

  final LoginCredentialUseCase _loginCredentialUseCase;
  final LoginPhoneUseCase _loginPhoneUseCase;
  final VerifyPhoneUseCase _verifyPhoneUseCase;

  String? _verifierId;

  void tryLoginByCredential(String email, String password) async {
    try {
      _loginByCredential(email, password);
    } on BaseException catch (e) {
      emit(FailureMessageLogin(e.type, message: e.message));
    }
  }

  void _loginByCredential(String email, String password) async {
    await _loginCredentialUseCase.execute(email, password);
    emit(const AuthorizedState());
  }

  void loginByPhone(String phone) async {
    try {
      await _loginPhoneUseCase.execute(phone, authorized: _loginSuccess, verifying: _loginVerifierId);
    } on BaseException catch (e) {
      emit(FailureMessageLogin(e.type, message: e.message));
    }
  }

  void tryVerifyPhone(String code) async {
    try {
      _verifyPhone(code);
    } on BaseException catch (e) {
      emit(FailureMessageLogin(e.type, message: e.message));
    }
  }

  void skipPhoneNumberState() async {
    emit(state.copyWith(phoneStep: PhoneStep.phone));
  }

  void switchLoginAsPhone() async {
    emit(state.copyWith(authType: AuthType.phone));
  }

  void switchLoginAsCredential() async {
    emit(state.copyWith(authType: AuthType.credential));
  }

  void _verifyPhone(String code) async {
    await _verifyPhoneUseCase.execute(code, _verifierId!);
    emit(const AuthorizedState());
  }

  void _loginSuccess(UserModel user) {
    emit(const AuthorizedState());
  }

  void _loginVerifierId(String id) {
    _verifierId = id;
    emit(state.copyWith(phoneStep: PhoneStep.verify));
  }
}
