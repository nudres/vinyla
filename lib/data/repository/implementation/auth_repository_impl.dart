import 'package:injectable/injectable.dart';
import 'package:vinyla/data/datasource/datasource.dart';
import 'package:vinyla/data/dto/dto.dart';
import 'package:vinyla/domain/repository/repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authDatasource);

  final FirebaseAuthDatasource _authDatasource;

  @override
  Future<UserDTO> loginByCredential(String email, String password) async {
    final user = await _authDatasource.login(email, password);
    return UserDTO(uuid: user.uid, email: user.email, phone: user.phoneNumber);
  }

  @override
  Future<UserDTO> loginByPhone(String phone) {
    // TODO: implement loginByPhone
    throw UnimplementedError();
  }

  @override
  Future<UserDTO?> getAuthorizedUser() async {
    final user = await _authDatasource.user();
    return user == null ? null : UserDTO(uuid: user.uid, email: user.email, phone: user.phoneNumber);
  }
}
