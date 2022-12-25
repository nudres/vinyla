import 'package:vinyla/config/di/di.dart';
import 'package:vinyla/data/data.dart';
import 'package:vinyla/domain/domain.dart';

@Injectable(as: GetProfileUseCase)
class GetProfileUseCaseImpl implements GetProfileUseCase {
  GetProfileUseCaseImpl(
    this._profileRepository,
    this._isUserAuthorizedUserUseCase,
    this._getAuthorizedUserUseCase,
    this._mapper,
  );

  final ProfileRepository _profileRepository;
  final IsUserAuthorizedUserUseCase _isUserAuthorizedUserUseCase;
  final GetAuthorizedUserUseCase _getAuthorizedUserUseCase;
  final Mapper<ProfileDTO, ProfileModel> _mapper;

  @override
  Future<ProfileModel> execute() async {
    final isAuthorized = await _isUserAuthorizedUserUseCase.execute();
    if (isAuthorized) {
      final user = await _getAuthorizedUserUseCase.execute();
      final dto = await _profileRepository.getProfile(user.uuid);
      return _mapper.mapToModel(dto).copyWith(email: user.email);
    } else {
      // TODO: ADD CUSTOM AUTH EXCEPTION
      throw Exception("User is not authorized");
    }
  }
}
