import 'package:vinyla/data/data.dart';

abstract class ProfileRepository {
  Future<ProfileDTO> getProfile(String uid);

  Future<ProfileDTO> createProfile(String uid, ProfileDTO dto);
}
