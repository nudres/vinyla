import 'user_dto.dart';

class PhoneVerifierDTO {
  PhoneVerifierDTO({
    this.user,
    this.verifyId,
  });

  final UserDTO? user;
  final String? verifyId;
}
