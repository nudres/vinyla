import 'package:vinyla/data/data.dart';

abstract class AuthRepository {
  Future<PhoneVerifierDTO> loginByPhone(String phone);

  Future<UserDTO> verifyPhone(String verificationId, String phone);

  Future<UserDTO> loginByCredential(String email, String password);

  Future<UserDTO?> getAuthorizedUser();
}
