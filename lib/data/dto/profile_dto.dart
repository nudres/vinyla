import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_dto.freezed.dart';

part 'profile_dto.g.dart';

@freezed
class ProfileDTO with _$ProfileDTO {
  const factory ProfileDTO({
    required String login,
    required String firstName,
    required String secondName,
    required String fullName,
    required String bio,
  }) = _ProfileDTO;

  factory ProfileDTO.fromJson(Map<String, Object?> json) => _$ProfileDTOFromJson(json);
}
