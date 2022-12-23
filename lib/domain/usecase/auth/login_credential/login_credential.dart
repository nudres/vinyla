import 'package:vinyla/domain/domain.dart';

abstract class LoginCredentialUseCase {
  Future<UserModel> execute(String email, String password);
}
