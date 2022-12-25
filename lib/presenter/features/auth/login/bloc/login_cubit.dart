import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:vinyla/domain/domain.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._useCase) : super(LoginInitial());

  final LoginCredentialUseCase _useCase;

  void loginByCredential(String email, String password) async {
    try {
      await _useCase.execute(email, password);
      emit(SuccessLogin());
    } on BaseException catch (e) {
      emit(FailureTypeLogin(e.type));
    } catch (e) {
      emit(FailureMessageLogin(e.toString()));
    }
  }
}
