import 'package:injectable/injectable.dart';
import 'package:vinyla/data/data.dart';
import 'package:vinyla/domain/domain.dart';

@Injectable(as: Mapper<ProfileDTO, ProfileModel>)
class ProfileMapper extends Mapper<ProfileDTO, ProfileModel> {
  @override
  ProfileDTO mapToDto(ProfileModel model) {
    return ProfileDTO(
      login: model.login,
      firstName: model.fullName,
      bio: model.bio,
      secondName: model.secondName,
    );
  }

  @override
  ProfileModel mapToModel(ProfileDTO dto) {
    return ProfileModel(
      login: dto.login,
      bio: dto.bio,
      firstName: dto.firstName,
      secondName: dto.secondName,
    );
  }
}
