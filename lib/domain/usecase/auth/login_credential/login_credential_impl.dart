import 'package:vinyla/config/di/di.dart';
import 'package:vinyla/data/data.dart';
import 'package:vinyla/domain/domain.dart';

@Injectable(as: LoginCredentialUseCase)
class LoginCredentialUseCaseImpl implements LoginCredentialUseCase {
  LoginCredentialUseCaseImpl(this.authRepository, this.mapper);

  final AuthRepository authRepository;
  final Mapper<UserDTO, UserModel> mapper;

  @override
  Future<UserModel> execute(String email, String password) async {
    final dto = await authRepository.loginByCredential(email, password);
    return mapper.mapToModel(dto);
  }
}
