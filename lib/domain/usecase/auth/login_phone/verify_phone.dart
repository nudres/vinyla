import 'package:vinyla/domain/domain.dart';

abstract class VerifyPhoneUseCase {
  Future<UserModel> execute(String code, String verifierId);
}
