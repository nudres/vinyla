import 'package:injectable/injectable.dart';
import 'package:vinyla/data/datasource/datasource.dart';
import 'package:vinyla/data/dto/dto.dart';
import 'package:vinyla/domain/domain.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final FirebaseDatabaseDatasource firebaseRealtimeDatasource;

  ProfileRepositoryImpl(this.firebaseRealtimeDatasource);

  @override
  Future<ProfileDTO> getProfile(String uid) async {
    var res = await firebaseRealtimeDatasource.get("/user/$uid");

  @override
  Future<ProfileDTO> createProfile(String uid, ProfileDTO dto) async {
    var res = await firebaseRealtimeDatasource.post("/user/$uid", dto.toJson());
    return ProfileDTO.fromJson(res);
  }
}
