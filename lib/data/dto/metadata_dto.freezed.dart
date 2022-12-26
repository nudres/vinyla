// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metadata_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MetadataDTO _$MetadataDTOFromJson(Map<String, dynamic> json) {
  return _MetadataDTO.fromJson(json);
}

/// @nodoc
mixin _$MetadataDTO {
  String get notificationToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetadataDTOCopyWith<MetadataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetadataDTOCopyWith<$Res> {
  factory $MetadataDTOCopyWith(
          MetadataDTO value, $Res Function(MetadataDTO) then) =
      _$MetadataDTOCopyWithImpl<$Res, MetadataDTO>;
  @useResult
  $Res call({String notificationToken});
}

/// @nodoc
class _$MetadataDTOCopyWithImpl<$Res, $Val extends MetadataDTO>
    implements $MetadataDTOCopyWith<$Res> {
  _$MetadataDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationToken = null,
  }) {
    return _then(_value.copyWith(
      notificationToken: null == notificationToken
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MetadataDTOCopyWith<$Res>
    implements $MetadataDTOCopyWith<$Res> {
  factory _$$_MetadataDTOCopyWith(
          _$_MetadataDTO value, $Res Function(_$_MetadataDTO) then) =
      __$$_MetadataDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String notificationToken});
}

/// @nodoc
class __$$_MetadataDTOCopyWithImpl<$Res>
    extends _$MetadataDTOCopyWithImpl<$Res, _$_MetadataDTO>
    implements _$$_MetadataDTOCopyWith<$Res> {
  __$$_MetadataDTOCopyWithImpl(
      _$_MetadataDTO _value, $Res Function(_$_MetadataDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationToken = null,
  }) {
    return _then(_$_MetadataDTO(
      notificationToken: null == notificationToken
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MetadataDTO with DiagnosticableTreeMixin implements _MetadataDTO {
  const _$_MetadataDTO({required this.notificationToken});

  factory _$_MetadataDTO.fromJson(Map<String, dynamic> json) =>
      _$$_MetadataDTOFromJson(json);

  @override
  final String notificationToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MetadataDTO(notificationToken: $notificationToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MetadataDTO'))
      ..add(DiagnosticsProperty('notificationToken', notificationToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MetadataDTO &&
            (identical(other.notificationToken, notificationToken) ||
                other.notificationToken == notificationToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notificationToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MetadataDTOCopyWith<_$_MetadataDTO> get copyWith =>
      __$$_MetadataDTOCopyWithImpl<_$_MetadataDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MetadataDTOToJson(
      this,
    );
  }
}

abstract class _MetadataDTO implements MetadataDTO {
  const factory _MetadataDTO({required final String notificationToken}) =
      _$_MetadataDTO;

  factory _MetadataDTO.fromJson(Map<String, dynamic> json) =
      _$_MetadataDTO.fromJson;

  @override
  String get notificationToken;
  @override
  @JsonKey(ignore: true)
  _$$_MetadataDTOCopyWith<_$_MetadataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
