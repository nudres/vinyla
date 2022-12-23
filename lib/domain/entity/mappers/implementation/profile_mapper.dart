import 'package:injectable/injectable.dart';
import 'package:vinyla/data/data.dart';
import 'package:vinyla/domain/domain.dart';

@Injectable(as: Mapper<ProfileDTO, ProfileModel>)
class ProfileMapper extends Mapper<ProfileDTO, ProfileModel> {
  @override
  ProfileDTO mapToDto(ProfileModel model) {
    return ProfileDTO(
      login: model.login,
      dateOfCreation: model.dateOfCreation,
      dateOfLastVisit: model.dateOfLastVisit,
      firstName: model.fullName,
      bio: model.bio,
      secondName: model.secondName,
      fullName: model.fullName,
    );
  }

  @override
  ProfileModel mapToModel(ProfileDTO dto) {
    return ProfileModel(
      login: dto.login,
      bio: dto.bio,
      dateOfCreation: dto.dateOfCreation,
      dateOfLastVisit: dto.dateOfLastVisit,
      firstName: dto.firstName,
      secondName: dto.secondName,
      fullName: dto.fullName,
    );
  }
}
