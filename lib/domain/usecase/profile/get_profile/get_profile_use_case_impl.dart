import 'package:vinyla/config/di/di.dart';
import 'package:vinyla/data/data.dart';
import 'package:vinyla/domain/domain.dart';

@Injectable(as: GetProfileUseCase)
class GetProfileUseCaseImpl implements GetProfileUseCase {
  GetProfileUseCaseImpl(this.profileRepository, this.mapper);

  final ProfileRepository profileRepository;
  final Mapper<ProfileDTO, ProfileModel> mapper;

  @override
  Future<ProfileModel> execute(String uuid) async {
    final dto = await profileRepository.getProfile(uuid);
    return mapper.mapToModel(dto);
  }
}
