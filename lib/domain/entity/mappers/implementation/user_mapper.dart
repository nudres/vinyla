import 'package:injectable/injectable.dart';
import 'package:vinyla/data/data.dart';
import 'package:vinyla/domain/domain.dart';

@Injectable(as: Mapper<UserDTO, UserModel>)
class UserMapper extends Mapper<UserDTO, UserModel> {
  @override
  UserDTO mapToDto(UserModel model) {
    return UserDTO(
      uuid: model.uuid,
      email: model.email,
      phone: model.phone,
    );
  }

  @override
  UserModel mapToModel(UserDTO dto) {
    return UserModel(
      uuid: dto.uuid,
      email: dto.email,
      phone: dto.phone,
    );
  }
}
