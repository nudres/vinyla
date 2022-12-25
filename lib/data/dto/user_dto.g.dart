// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDTO _$$_UserDTOFromJson(Map<String, dynamic> json) => _$_UserDTO(
      uuid: json['uuid'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      dateOfCreation: json['dateOfCreation'] == null
          ? null
          : DateTime.parse(json['dateOfCreation'] as String),
      dateOfLastVisit: json['dateOfLastVisit'] == null
          ? null
          : DateTime.parse(json['dateOfLastVisit'] as String),
    );

Map<String, dynamic> _$$_UserDTOToJson(_$_UserDTO instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'email': instance.email,
      'phone': instance.phone,
      'dateOfCreation': instance.dateOfCreation?.toIso8601String(),
      'dateOfLastVisit': instance.dateOfLastVisit?.toIso8601String(),
    };
