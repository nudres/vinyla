import 'package:vinyla/config/di/di.dart';
import 'package:vinyla/domain/domain.dart';

@Injectable(as: IsUserAuthorizedUserUseCase)
class IsUserAuthorizedUserUseCaseImpl implements IsUserAuthorizedUserUseCase {
  IsUserAuthorizedUserUseCaseImpl(
    this.authRepository,
  );

  final AuthRepository authRepository;

  @override
  Future<bool> execute() async {
    final dto = await authRepository.getAuthorizedUser();
    return dto != null;
  }
}
