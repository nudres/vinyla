import 'package:vinyla/config/di/di.dart';
import 'package:vinyla/data/data.dart';
import 'package:vinyla/domain/domain.dart';

@Injectable(as: GetAuthorizedUserUseCase)
class GetAuthorizedUserUseCaseImpl implements GetAuthorizedUserUseCase {
  GetAuthorizedUserUseCaseImpl(
    this._authRepository,
    this._mapper,
  );

  final AuthRepository _authRepository;
  final Mapper<UserDTO, UserModel> _mapper;

  @override
  Future<UserModel> execute() async {
    final dto = await _authRepository.getAuthorizedUser();

    if (dto != null) {
      return _mapper.mapToModel(dto);
    } else {
      // TODO: ADD CUSTOM AUTH EXCEPTION
      throw Exception("User is not authorized");
    }
  }
}
