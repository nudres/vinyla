// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data.dart' as _i13;
import '../../data/datasource/config/firebase_exception_keys.dart' as _i7;
import '../../data/datasource/config/http_config.dart' as _i10;
import '../../data/datasource/datasource.dart' as _i5;
import '../../data/datasource/firebase/firebase_auth_datasource.dart' as _i18;
import '../../data/datasource/firebase/firebase_database_datasource.dart'
    as _i9;
import '../../data/repository/implementation/auth_repository_impl.dart' as _i4;
import '../../data/repository/implementation/profile_repository_impl.dart'
    as _i16;
import '../../domain/domain.dart' as _i11;
import '../../domain/entity/mappers/implementation/profile_mapper.dart' as _i15;
import '../../domain/entity/mappers/implementation/user_mapper.dart' as _i14;
import '../../domain/repository/repository.dart' as _i3;
import '../../domain/usecase/auth/get_authorized_user/get_authorized_user_impl.dart'
    as _i19;
import '../../domain/usecase/auth/is_user_authorized/is_user_authorized_user_impl.dart'
    as _i12;
import '../../domain/usecase/auth/login_credential/login_credential_impl.dart'
    as _i21;
import '../../domain/usecase/auth/login_phone/login_phone_impl.dart' as _i22;
import '../../domain/usecase/auth/login_phone/verify_phone_impl.dart' as _i17;
import '../../domain/usecase/profile/get_profile/get_profile_use_case_impl.dart'
    as _i20;
import 'injection.dart' as _i23; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AuthRepository>(
      () => _i4.AuthRepositoryImpl(get<_i5.FirebaseAuthDatasource>()));
  gh.singleton<_i6.FirebaseAuth>(registerModule.auth());
  gh.singleton<_i7.FirebaseExceptionKeys>(_i7.FirebaseExceptionKeys());
  gh.singleton<_i8.FirebaseFirestore>(registerModule.database());
  gh.singleton<_i9.FirebaseDatabaseDatasource>(
      _i9.FirebaseDatabaseDatasource(get<_i8.FirebaseFirestore>()));
  gh.singleton<_i10.HttpConfig>(_i10.HttpConfig());
  gh.factory<_i11.IsUserAuthorizedUserUseCase>(
      () => _i12.IsUserAuthorizedUserUseCaseImpl(get<_i11.AuthRepository>()));
  gh.factory<_i11.Mapper<_i13.UserDTO, _i11.UserModel>>(
      () => _i14.UserMapper());
  gh.factory<_i11.Mapper<_i13.ProfileDTO, _i11.ProfileModel>>(
      () => _i15.ProfileMapper());
  gh.factory<_i11.ProfileRepository>(
      () => _i16.ProfileRepositoryImpl(get<_i5.FirebaseDatabaseDatasource>()));
  gh.factory<_i11.VerifyPhoneUseCase>(() => _i17.VerifyPhoneUseCaseImpl(
        get<_i11.AuthRepository>(),
        get<_i11.Mapper<_i13.UserDTO, _i11.UserModel>>(),
        get<_i13.FirebaseExceptionKeys>(),
      ));
  gh.singleton<_i18.FirebaseAuthDatasource>(_i18.FirebaseAuthDatasource(
    get<_i6.FirebaseAuth>(),
    get<_i10.HttpConfig>(),
  ));
  gh.factory<_i11.GetAuthorizedUserUseCase>(
      () => _i19.GetAuthorizedUserUseCaseImpl(
            get<_i11.AuthRepository>(),
            get<_i11.Mapper<_i13.UserDTO, _i11.UserModel>>(),
          ));
  gh.factory<_i11.GetProfileUseCase>(() => _i20.GetProfileUseCaseImpl(
        get<_i11.ProfileRepository>(),
        get<_i11.IsUserAuthorizedUserUseCase>(),
        get<_i11.GetAuthorizedUserUseCase>(),
        get<_i11.Mapper<_i13.ProfileDTO, _i11.ProfileModel>>(),
      ));
  gh.factory<_i11.LoginCredentialUseCase>(() => _i21.LoginCredentialUseCaseImpl(
        get<_i11.AuthRepository>(),
        get<_i11.Mapper<_i13.UserDTO, _i11.UserModel>>(),
      ));
  gh.factory<_i11.LoginPhoneUseCase>(() => _i22.LoginPhoneUseCaseImpl(
        get<_i11.AuthRepository>(),
        get<_i11.Mapper<_i13.UserDTO, _i11.UserModel>>(),
        get<_i13.FirebaseExceptionKeys>(),
      ));
  return get;
}

class _$RegisterModule extends _i23.RegisterModule {}
