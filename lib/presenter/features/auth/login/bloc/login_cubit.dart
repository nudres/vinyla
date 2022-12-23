import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import 'package:vinyla/domain/usecase/auth/login_credential/login_credential.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._useCase) : super(LoginInitial());

  final LoginCredentialUseCase _useCase;

  void loginByCredential(String email, String password) async {
    try {
      await _useCase.execute(email, password);
      emit(SuccessLogin());
    } catch (e) {
      emit(FailureLogin());
    }
  }
}
