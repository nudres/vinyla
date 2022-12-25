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
    return ProfileDTO.fromJson(res);
  }
}
