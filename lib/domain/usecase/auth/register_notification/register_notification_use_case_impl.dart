import 'dart:async';

import 'package:vinyla/config/di/di.dart';
import 'package:vinyla/domain/domain.dart';

@Injectable(as: RegisterNotificationUseCase)
class RegisterNotificationUseCaseImpl implements RegisterNotificationUseCase {
  RegisterNotificationUseCaseImpl(
    this._authRepository,
  );

  final AuthRepository _authRepository;

  @override
  Future execute(String uuid) async {
    try {
      return _authRepository.registerFCMToken(uuid);
    } on TimeoutException catch (_) {
      throw BaseException(type: BaseExceptionType.authTimeoutConnection);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
