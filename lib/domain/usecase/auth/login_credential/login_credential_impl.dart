import 'dart:async';

import 'package:vinyla/config/di/di.dart';
import 'package:vinyla/data/data.dart';
import 'package:vinyla/domain/domain.dart';

@Injectable(as: LoginCredentialUseCase)
class LoginCredentialUseCaseImpl implements LoginCredentialUseCase {
  LoginCredentialUseCaseImpl(this.authRepository, this.mapper);

  final AuthRepository authRepository;
  final Mapper<UserDTO, UserModel> mapper;

  final _firebaseAuthTimeoutFailureKey = "firebase_auth/network-request-failed";

  @override
  Future<UserModel> execute(String email, String password) async {
    try {
      final dto = await authRepository.loginByCredential(email, password);
      return mapper.mapToModel(dto);
    } on TimeoutException catch (_) {
      throw BaseException(type: BaseExceptionType.authTimeoutConnection);
    } catch (e) {
      if (e.toString().contains(_firebaseAuthTimeoutFailureKey)) {
        throw BaseException(type: BaseExceptionType.authTimeoutConnection);
      } else {
        rethrow;
      }
    }
  }
}
