// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../modules/auth/data/datasource/auth.datasource.dart' as _i3;
import '../modules/auth/data/repository/auth.repository.dart' as _i4;
import '../modules/base/data/datasource/verify_auth_local.datasource.dart'
    as _i7;
import '../modules/base/data/datasource/verify_auth_remote.datasource.dart'
    as _i8;
import '../modules/base/data/repository/verify_auth.repository.dart' as _i9;
import '../modules/favorite_host/data/datasource/favorite_host.datasource.dart'
    as _i5;
import '../modules/favorite_host/data/repository/favorite_host.repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.VerifyAuthLocalDataSource>(
      () => _i7.VerifyAuthLocalDataSource());
  gh.lazySingleton<_i8.VeriryAuthRemoteDataSource>(
      () => _i8.VeriryAuthRemoteDataSource());
  gh.lazySingleton<_i9.VeriryAuthRepository>(() => _i9.VeriryAuthRepository(
        remoteDataSource: get<_i8.VeriryAuthRemoteDataSource>(),
        localDataSource: get<_i7.VerifyAuthLocalDataSource>(),
      ));
  return get;
}
