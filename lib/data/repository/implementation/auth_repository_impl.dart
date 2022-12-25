import 'package:injectable/injectable.dart';

import 'package:vinyla/data/datasource/datasource.dart';
import 'package:vinyla/data/dto/dto.dart';

import 'package:vinyla/domain/repository/repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authDatasource);

  final FirebaseAuthDatasource _authDatasource;

  @override
  Future<UserDTO> loginByCredential(String email, String password) {
    return _authDatasource.login(email, password);
  }

  @override
  Future<PhoneVerifierDTO> loginByPhone(String phone) {
    return _authDatasource.loginByPhone(phone);
  }

  @override
  Future<UserDTO?> getAuthorizedUser() {
    return _authDatasource.user();
  }

  @override
  Future<UserDTO> verifyPhone(verificationId, String phone) {
    return _authDatasource.verifyPhone(verificationId, phone);
  }
}
