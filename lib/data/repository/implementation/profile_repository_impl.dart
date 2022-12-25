import 'package:injectable/injectable.dart';

import 'package:vinyla/data/datasource/datasource.dart';
import 'package:vinyla/data/dto/dto.dart';

import 'package:vinyla/domain/domain.dart';

import '../../datasource/config/profile_initializer.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final FirebaseDatabaseDatasource firebaseRealtimeDatasource;
  final ProfileInitializer profileInitializer;

  ProfileRepositoryImpl(
    this.firebaseRealtimeDatasource,
    this.profileInitializer,
  );

  @override
  Future<ProfileDTO> getProfile(String uid) async {
    final profilePath = "/user/$uid";
    final isExits = await firebaseRealtimeDatasource.isExits(profilePath);

    if (isExits) {
      var res = await firebaseRealtimeDatasource.get(profilePath);
      return ProfileDTO.fromJson(res);
    } else {
      final profile = profileInitializer.generateProfile().toJson();
      var res = await firebaseRealtimeDatasource.post(profilePath, profile);
      return ProfileDTO.fromJson(res);
    }
  }

  @override
  Future<ProfileDTO> createProfile(String uid, ProfileDTO dto) async {
    var res = await firebaseRealtimeDatasource.post("/user/$uid", dto.toJson());
    return ProfileDTO.fromJson(res);
  }
}
