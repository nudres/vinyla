// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data.dart' as _i12;
import '../../data/datasource/config/http_config.dart' as _i9;
import '../../data/datasource/datasource.dart' as _i5;
import '../../data/datasource/firebase/firebase_auth_datasource.dart' as _i16;
import '../../data/datasource/firebase/firebase_realtime_datasource.dart'
    as _i8;
import '../../data/repository/implementation/auth_repository_impl.dart' as _i4;
import '../../data/repository/implementation/profile_repository_impl.dart'
    as _i15;
import '../../domain/domain.dart' as _i10;
import '../../domain/entity/mappers/implementation/profile_mapper.dart' as _i14;
import '../../domain/entity/mappers/implementation/user_mapper.dart' as _i13;
import '../../domain/repository/repository.dart' as _i3;
import '../../domain/usecase/auth/get_authorized_user/get_authorized_user_impl.dart'
    as _i17;
import '../../domain/usecase/auth/is_user_authorized/is_user_authorized_user_impl.dart'
    as _i11;
import '../../domain/usecase/auth/login_credential/login_credential_impl.dart'
    as _i19;
import '../../domain/usecase/profile/get_profile/get_profile_use_case_impl.dart'
    as _i18;
import 'injection.dart' as _i20; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i7.FirebaseFirestore>(registerModule.database());
  gh.singleton<_i8.FirebaseRealtimeDatasource>(
      _i8.FirebaseRealtimeDatasource(get<_i7.FirebaseFirestore>()));
  gh.singleton<_i9.HttpConfig>(_i9.HttpConfig());
  gh.factory<_i10.IsUserAuthorizedUserUseCase>(
      () => _i11.IsUserAuthorizedUserUseCaseImpl(get<_i10.AuthRepository>()));
  gh.factory<_i10.Mapper<_i12.UserDTO, _i10.UserModel>>(
      () => _i13.UserMapper());
  gh.factory<_i10.Mapper<_i12.ProfileDTO, _i10.ProfileModel>>(
      () => _i14.ProfileMapper());
  gh.factory<_i10.ProfileRepository>(
      () => _i15.ProfileRepositoryImpl(get<_i5.FirebaseRealtimeDatasource>()));
  gh.singleton<_i16.FirebaseAuthDatasource>(_i16.FirebaseAuthDatasource(
    get<_i6.FirebaseAuth>(),
    get<_i9.HttpConfig>(),
  ));
  gh.factory<_i10.GetAuthorizedUserUseCase>(
      () => _i17.GetAuthorizedUserUseCaseImpl(
            get<_i10.AuthRepository>(),
            get<_i10.Mapper<_i12.UserDTO, _i10.UserModel>>(),
          ));
  gh.factory<_i10.GetProfileUseCase>(() => _i18.GetProfileUseCaseImpl(
        get<_i10.ProfileRepository>(),
        get<_i10.IsUserAuthorizedUserUseCase>(),
        get<_i10.GetAuthorizedUserUseCase>(),
        get<_i10.Mapper<_i12.ProfileDTO, _i10.ProfileModel>>(),
      ));
  gh.factory<_i10.LoginCredentialUseCase>(() => _i19.LoginCredentialUseCaseImpl(
        get<_i10.AuthRepository>(),
        get<_i10.Mapper<_i12.UserDTO, _i10.UserModel>>(),
      ));
  return get;
}

class _$RegisterModule extends _i20.RegisterModule {}
