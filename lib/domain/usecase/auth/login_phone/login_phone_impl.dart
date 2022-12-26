import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:vinyla/config/di/di.dart';

import 'package:vinyla/data/data.dart';

import 'package:vinyla/domain/domain.dart';

@Injectable(as: LoginPhoneUseCase)
class LoginPhoneUseCaseImpl implements LoginPhoneUseCase {
  LoginPhoneUseCaseImpl(
    this._authRepository,
    this._registerNotificationUseCase,
    this._mapper,
    this._firebaseExceptionKeys,
  );

  final AuthRepository _authRepository;
  final Mapper<UserDTO, UserModel> _mapper;
  final FirebaseExceptionKeys _firebaseExceptionKeys;
  final RegisterNotificationUseCase _registerNotificationUseCase;

  @override
  Future execute(
    String phone, {
    required Function(UserModel user) authorized,
    required Function(String verifierId) verifying,
  }) async {
    try {
      final result = await _authRepository.loginByPhone(phone);

      if (result.user != null) {
        await _registerNotificationUseCase.execute(result.user!.uuid);
        return authorized(_mapper.mapToModel(result.user!));
      }

      if (result.verifyId != null) {
        return verifying(result.verifyId!);
      }
      throw BaseException(type: BaseExceptionType.authPhoneUnknownException);
    } on TimeoutException catch (_) {
      throw BaseException(type: BaseExceptionType.authTimeoutConnection);
    } on FirebaseAuthException catch (e) {
      throw BaseException(message: e.message, type: BaseExceptionType.authParcelableFirebaseException);
    } catch (e) {
      if (e.toString().contains(_firebaseExceptionKeys.firebaseAuthTimeoutFailureKey)) {
        throw BaseException(type: BaseExceptionType.authTimeoutConnection);
      } else {
        throw BaseException(message: e.toString());
      }
    }
  }
}
