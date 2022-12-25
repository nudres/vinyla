// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileDTO _$$_ProfileDTOFromJson(Map<String, dynamic> json) =>
    _$_ProfileDTO(
      login: json['login'] as String,
      firstName: json['firstName'] as String,
      secondName: json['secondName'] as String,
      bio: json['bio'] as String,
    );

Map<String, dynamic> _$$_ProfileDTOToJson(_$_ProfileDTO instance) =>
    <String, dynamic>{
      'login': instance.login,
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'bio': instance.bio,
    };
