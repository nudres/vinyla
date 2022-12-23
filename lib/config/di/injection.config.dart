// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'injection.dart' as _i21; // ignore_for_file: unnecessary_lambdas
import '../../data/datasource/datasource.dart' as _i5;
import '../../data/datasource/firebase/firebase_auth_datasource.dart' as _i7;
import '../../data/datasource/firebase/firebase_realtime_datasource.dart'
    as _i9;
import '../../domain/entity/mappers/implementation/profile_mapper.dart' as _i13;
import '../../domain/entity/mappers/implementation/user_mapper.dart' as _i12;
import 'injection.dart' as _i16; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i3.FirebaseAuth>(registerModule.auth());
  gh.singleton<_i5.FirebaseFirestore>(registerModule.database());
  gh.singleton<_i6.FirebaseAuth>(registerModule.auth());
  gh.singleton<_i7.FirebaseAuthDatasource>(
      _i7.FirebaseAuthDatasource(get<_i6.FirebaseAuth>()));
  gh.singleton<_i8.FirebaseFirestore>(registerModule.database());
  gh.singleton<_i9.FirebaseRealtimeDatasource>(
      _i9.FirebaseRealtimeDatasource(get<_i8.FirebaseFirestore>()));
  gh.factory<_i10.Mapper<_i11.UserDTO, _i10.UserModel>>(
      () => _i12.UserMapper());
  gh.factory<_i10.Mapper<_i11.ProfileDTO, _i10.ProfileModel>>(
      () => _i13.ProfileMapper());
  return get;
}

class _$RegisterModule extends _i21.RegisterModule {}
