// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileDTO _$ProfileDTOFromJson(Map<String, dynamic> json) {
  return _ProfileDTO.fromJson(json);
}

/// @nodoc
mixin _$ProfileDTO {
  String get login => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get secondName => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String get dateOfCreation => throw _privateConstructorUsedError;
  String get dateOfLastVisit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDTOCopyWith<ProfileDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDTOCopyWith<$Res> {
  factory $ProfileDTOCopyWith(
          ProfileDTO value, $Res Function(ProfileDTO) then) =
      _$ProfileDTOCopyWithImpl<$Res, ProfileDTO>;
  @useResult
  $Res call(
      {String login,
      String firstName,
      String secondName,
      String fullName,
      String bio,
      String dateOfCreation,
      String dateOfLastVisit});
}

/// @nodoc
class _$ProfileDTOCopyWithImpl<$Res, $Val extends ProfileDTO>
    implements $ProfileDTOCopyWith<$Res> {
  _$ProfileDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? firstName = null,
    Object? secondName = null,
    Object? fullName = null,
    Object? bio = null,
    Object? dateOfCreation = null,
    Object? dateOfLastVisit = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      secondName: null == secondName
          ? _value.secondName
          : secondName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfCreation: null == dateOfCreation
          ? _value.dateOfCreation
          : dateOfCreation // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfLastVisit: null == dateOfLastVisit
          ? _value.dateOfLastVisit
          : dateOfLastVisit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileDTOCopyWith<$Res>
    implements $ProfileDTOCopyWith<$Res> {
  factory _$$_ProfileDTOCopyWith(
          _$_ProfileDTO value, $Res Function(_$_ProfileDTO) then) =
      __$$_ProfileDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String login,
      String firstName,
      String secondName,
      String fullName,
      String bio,
      String dateOfCreation,
      String dateOfLastVisit});
}

/// @nodoc
class __$$_ProfileDTOCopyWithImpl<$Res>
    extends _$ProfileDTOCopyWithImpl<$Res, _$_ProfileDTO>
    implements _$$_ProfileDTOCopyWith<$Res> {
  __$$_ProfileDTOCopyWithImpl(
      _$_ProfileDTO _value, $Res Function(_$_ProfileDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? firstName = null,
    Object? secondName = null,
    Object? fullName = null,
    Object? bio = null,
    Object? dateOfCreation = null,
    Object? dateOfLastVisit = null,
  }) {
    return _then(_$_ProfileDTO(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      secondName: null == secondName
          ? _value.secondName
          : secondName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfCreation: null == dateOfCreation
          ? _value.dateOfCreation
          : dateOfCreation // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfLastVisit: null == dateOfLastVisit
          ? _value.dateOfLastVisit
          : dateOfLastVisit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileDTO with DiagnosticableTreeMixin implements _ProfileDTO {
  const _$_ProfileDTO(
      {required this.login,
      required this.firstName,
      required this.secondName,
      required this.fullName,
      required this.bio,
      required this.dateOfCreation,
      required this.dateOfLastVisit});

  factory _$_ProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileDTOFromJson(json);

  @override
  final String login;
  @override
  final String firstName;
  @override
  final String secondName;
  @override
  final String fullName;
  @override
  final String bio;
  @override
  final String dateOfCreation;
  @override
  final String dateOfLastVisit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileDTO(login: $login, firstName: $firstName, secondName: $secondName, fullName: $fullName, bio: $bio, dateOfCreation: $dateOfCreation, dateOfLastVisit: $dateOfLastVisit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileDTO'))
      ..add(DiagnosticsProperty('login', login))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('secondName', secondName))
      ..add(DiagnosticsProperty('fullName', fullName))
      ..add(DiagnosticsProperty('bio', bio))
      ..add(DiagnosticsProperty('dateOfCreation', dateOfCreation))
      ..add(DiagnosticsProperty('dateOfLastVisit', dateOfLastVisit));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileDTO &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.secondName, secondName) ||
                other.secondName == secondName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.dateOfCreation, dateOfCreation) ||
                other.dateOfCreation == dateOfCreation) &&
            (identical(other.dateOfLastVisit, dateOfLastVisit) ||
                other.dateOfLastVisit == dateOfLastVisit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, login, firstName, secondName,
      fullName, bio, dateOfCreation, dateOfLastVisit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileDTOCopyWith<_$_ProfileDTO> get copyWith =>
      __$$_ProfileDTOCopyWithImpl<_$_ProfileDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileDTOToJson(
      this,
    );
  }
}

abstract class _ProfileDTO implements ProfileDTO {
  const factory _ProfileDTO(
      {required final String login,
      required final String firstName,
      required final String secondName,
      required final String fullName,
      required final String bio,
      required final String dateOfCreation,
      required final String dateOfLastVisit}) = _$_ProfileDTO;

  factory _ProfileDTO.fromJson(Map<String, dynamic> json) =
      _$_ProfileDTO.fromJson;

  @override
  String get login;
  @override
  String get firstName;
  @override
  String get secondName;
  @override
  String get fullName;
  @override
  String get bio;
  @override
  String get dateOfCreation;
  @override
  String get dateOfLastVisit;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileDTOCopyWith<_$_ProfileDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
