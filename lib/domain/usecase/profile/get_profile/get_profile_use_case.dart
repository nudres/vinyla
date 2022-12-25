import 'package:vinyla/domain/domain.dart';

abstract class GetProfileUseCase {
  Future<ProfileModel> execute();
}
