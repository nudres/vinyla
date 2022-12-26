import 'dart:async';

import 'package:vinyla/config/di/di.dart';
import 'package:vinyla/data/data.dart';
import 'package:vinyla/domain/domain.dart';

@Injectable(as: LoginCredentialUseCase)
class LoginCredentialUseCaseImpl implements LoginCredentialUseCase {
  LoginCredentialUseCaseImpl(
    this._authRepository,
    this._registerNotificationUseCase,
    this._mapper,
    this._firebaseExceptionKeys,
  );

  final AuthRepository _authRepository;
  final Mapper<UserDTO, UserModel> _mapper;
  final RegisterNotificationUseCase _registerNotificationUseCase;
  final FirebaseExceptionKeys _firebaseExceptionKeys;

  @override
  Future<UserModel> execute(String email, String password) async {
    try {
      final dto = await _authRepository.loginByCredential(email, password);
      await _registerNotificationUseCase.execute(dto.uuid);
      return _mapper.mapToModel(dto);
    } on TimeoutException catch (_) {
      throw BaseException(type: BaseExceptionType.authTimeoutConnection);
    } catch (e) {
      if (e.toString().contains(_firebaseExceptionKeys.firebaseAuthTimeoutFailureKey)) {
        throw BaseException(type: BaseExceptionType.authTimeoutConnection);
      } else {
        throw BaseException(message: e.toString());
      }
    }
  }
}
