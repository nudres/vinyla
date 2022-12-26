import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata_dto.freezed.dart';

part 'metadata_dto.g.dart';

@freezed
class MetadataDTO with _$MetadataDTO {
  const factory MetadataDTO({
    required String notificationToken,
  }) = _MetadataDTO;

  factory MetadataDTO.fromJson(Map<String, Object?> json) => _$MetadataDTOFromJson(json);
}
