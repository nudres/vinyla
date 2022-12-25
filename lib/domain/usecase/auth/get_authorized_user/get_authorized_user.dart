import 'package:vinyla/domain/domain.dart';

abstract class GetAuthorizedUserUseCase {
  Future<UserModel> execute();
}
