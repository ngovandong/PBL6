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
    as _i17;
import '../modules/base/data/datasource/verify_auth_remote.datasource.dart'
    as _i18;
import '../modules/base/data/repository/verify_auth.repository.dart' as _i19;
import '../modules/booking_history/data/datasources/booking_history.datasource.dart'
    as _i6;
import '../modules/booking_history/data/repositories/booking_history.repository.dart'
    as _i7;
import '../modules/favorite_host/data/datasource/favorite_host.datasource.dart'
    as _i9;
import '../modules/favorite_host/data/repository/favorite_host.repository.dart'
    as _i10;
import '../modules/home/data/datasources/location.datasource.dart' as _i13;
import '../modules/home/data/repositories/location.repository.dart' as _i14;
import '../modules/hotel_detail/data/datasources/booking.datasource.dart'
    as _i5;
import '../modules/hotel_detail/data/repositories/booking.repository.dart'
    as _i8;
import '../modules/profile/data/datasources/profile.datasource.dart' as _i15;
import '../modules/profile/data/repositories/profile.repository.dart' as _i16;
import '../modules/search_hotel/data/datasources/host.datasource.dart' as _i11;
import '../modules/search_hotel/data/repositories/host.repository.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i5.BookingDataSource>(() => _i5.BookingDataSource());
  gh.lazySingleton<_i6.BookingHistoryDataSource>(
      () => _i6.BookingHistoryDataSource());
  gh.lazySingleton<_i7.BookingHistoryRepository>(() =>
      _i7.BookingHistoryRepository(
          bookingHistoryDataSource: get<_i6.BookingHistoryDataSource>()));
  gh.lazySingleton<_i8.BookingRepository>(() =>
      _i8.BookingRepository(bookingDataSource: get<_i5.BookingDataSource>()));
  gh.lazySingleton<_i9.FavoriteHostDataSource>(
      () => _i9.FavoriteHostDataSource());
  gh.lazySingleton<_i10.FavoriteHostRepository>(() =>
      _i10.FavoriteHostRepository(
          dataSource: get<_i9.FavoriteHostDataSource>()));
  gh.lazySingleton<_i11.HostDataSource>(() => _i11.HostDataSource());
  gh.lazySingleton<_i12.HostRepository>(
      () => _i12.HostRepository(dataSource: get<_i11.HostDataSource>()));
  gh.lazySingleton<_i13.LocationDataSource>(() => _i13.LocationDataSource());
  gh.lazySingleton<_i14.LocationRepository>(() =>
      _i14.LocationRepository(dataSource: get<_i13.LocationDataSource>()));
  gh.lazySingleton<_i15.ProfileDataSource>(() => _i15.ProfileDataSource());
  gh.lazySingleton<_i16.ProfileRepository>(() =>
      _i16.ProfileRepository(profileDataSource: get<_i15.ProfileDataSource>()));
  gh.lazySingleton<_i17.VerifyAuthLocalDataSource>(
      () => _i17.VerifyAuthLocalDataSource());
  gh.lazySingleton<_i18.VeriryAuthRemoteDataSource>(
      () => _i18.VeriryAuthRemoteDataSource());
  gh.lazySingleton<_i19.VeriryAuthRepository>(() => _i19.VeriryAuthRepository(
        remoteDataSource: get<_i18.VeriryAuthRemoteDataSource>(),
        localDataSource: get<_i17.VerifyAuthLocalDataSource>(),
      ));
  return get;
}
