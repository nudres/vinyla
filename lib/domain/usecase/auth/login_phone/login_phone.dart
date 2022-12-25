import 'package:vinyla/domain/domain.dart';

abstract class LoginPhoneUseCase {
  Future execute(
    String phone, {
    required Function(UserModel user) authorized,
    required Function(String verifierId) verifying,
  });
}
