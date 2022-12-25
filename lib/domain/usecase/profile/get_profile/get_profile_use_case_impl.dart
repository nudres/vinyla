import 'package:intl/intl.dart';

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
      return _mapper.mapToModel(dto).copyWith(metadata: _prepareMetadata(user));
    } else {
      // TODO: ADD CUSTOM AUTH EXCEPTION
      throw Exception("User is not authorized");
    }
  }

  ProfileMetadataModel _prepareMetadata(UserModel userDTO) {
    final dateOfCreation = DateFormat.yMd().add_jm().format(userDTO.dateOfCreation!);
    final dateOfLastVisit = DateFormat.yMd().add_jm().format(userDTO.dateOfLastVisit!);

    return ProfileMetadataModel(
        dateOfCreation: dateOfCreation,
        dateOfLastVisit: dateOfLastVisit,
        email: userDTO.email,
        phone: userDTO.phone,
        isOnline: isOnline(userDTO.dateOfLastVisit));
  }

  bool isOnline(DateTime? dateTime) {
    const onlineRange = Duration(minutes: 5);
    final topOnlineLimit = DateTime.now().add(onlineRange);
    final bottomOnlineLimit = DateTime.now().subtract(onlineRange);

    if (dateTime != null) {
      return bottomOnlineLimit.isBefore(dateTime) && topOnlineLimit.isAfter(dateTime);
    } else {
      return false;
    }
  }
}
