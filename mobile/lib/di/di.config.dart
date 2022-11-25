// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../modules/auth/data/datasources/auth.datasource.dart' as _i3;
import '../modules/auth/data/repositories/auth.repository.dart' as _i4;
import '../modules/base/data/datasource/verify_auth_local.datasource.dart'
    as _i9;
import '../modules/base/data/datasource/verify_auth_remote.datasource.dart'
    as _i10;
import '../modules/base/data/repository/verify_auth.repository.dart' as _i11;
import '../modules/favorite_host/data/datasource/favorite_host.datasource.dart'
    as _i5;
import '../modules/favorite_host/data/repository/favorite_host.repository.dart'
    as _i6;
import '../modules/profile/data/datasources/profile.datasource.dart' as _i7;
import '../modules/profile/data/repositories/profile.repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.AuthDataSource>(() => _i3.AuthDataSource());
  gh.lazySingleton<_i4.AuthRepository>(
      () => _i4.AuthRepository(dataSource: get<_i3.AuthDataSource>()));
  gh.lazySingleton<_i5.FavoriteHostDataSource>(
      () => _i5.FavoriteHostDataSource());
  gh.lazySingleton<_i6.FavoriteHostRepository>(() => _i6.FavoriteHostRepository(
      dataSource: get<_i5.FavoriteHostDataSource>()));
  gh.lazySingleton<_i7.ProfileDataSource>(() => _i7.ProfileDataSource());
  gh.lazySingleton<_i8.ProfileRepository>(() =>
      _i8.ProfileRepository(profileDataSource: get<_i7.ProfileDataSource>()));
  gh.lazySingleton<_i9.VerifyAuthLocalDataSource>(
      () => _i9.VerifyAuthLocalDataSource());
  gh.lazySingleton<_i10.VeriryAuthRemoteDataSource>(
      () => _i10.VeriryAuthRemoteDataSource());
  gh.lazySingleton<_i11.VeriryAuthRepository>(() => _i11.VeriryAuthRepository(
        remoteDataSource: get<_i10.VeriryAuthRemoteDataSource>(),
        localDataSource: get<_i9.VerifyAuthLocalDataSource>(),
      ));
  return get;
}
