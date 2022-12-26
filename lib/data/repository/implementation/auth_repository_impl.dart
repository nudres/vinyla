import 'package:injectable/injectable.dart';

import 'package:vinyla/data/datasource/datasource.dart';
import 'package:vinyla/data/dto/dto.dart';

import 'package:vinyla/domain/repository/repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._authDatasource,
    this._databaseDatasource,
    this._fcmDatasource,
  );

  final FirebaseDatabaseDatasource _databaseDatasource;
  final FirebaseAuthDatasource _authDatasource;
  final FirebaseFCMDatasource _fcmDatasource;

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

  @override
  Future registerFCMToken(String uuid) async {
    final profilePath = "/metadata/$uuid";
    final isExits = await _databaseDatasource.isExits(profilePath);
    final fcmToken = await _fcmDatasource.token();
    final dto = MetadataDTO(notificationToken: fcmToken!).toJson();

    if (isExits) {
      return _databaseDatasource.patch(profilePath, dto);
    } else {
      return _databaseDatasource.post(profilePath, dto);
    }
  }
}
