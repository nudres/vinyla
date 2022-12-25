import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';

part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    required String uuid,
    required String? email,
    required String? phone,
    required DateTime? dateOfCreation,
    required DateTime? dateOfLastVisit,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, Object?> json) => _$UserDTOFromJson(json);
}
