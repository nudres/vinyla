import 'package:vinyla/data/data.dart';

abstract class AuthRepository {
  Future<UserDTO> loginByPhone(String phone);

  Future<UserDTO> loginByCredential(String email, String password);

  Future<UserDTO?> getAuthorizedUser();
}
