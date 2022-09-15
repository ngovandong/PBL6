import 'package:get_it/get_it.dart';
import 'package:mobile/modules/base/data/datasources/base_datasource.export.dart';
import 'package:mobile/modules/base/data/repositories/auth.repository.dart';
import 'package:mobile/modules/home/data/datasources/local/user.datasource.dart';
import 'package:mobile/modules/home/data/datasources/remote/user.datasource.dart';
import 'package:mobile/modules/home/data/repositories/user.repository.dart';

final GetIt getIt = GetIt.instance;

void initDependencies() {
  //* DATA SOURCES
  //Auth
  getIt.registerLazySingleton(() => AuthRemoteDataSource());
  getIt.registerLazySingleton(() => AuthLocalDataSource());
  // User
  getIt.registerLazySingleton(() => UserLocalDataSource());
  getIt.registerLazySingleton(() => UserRemoteDataSource());

  //* REPOSITORIES
  // User
  getIt.registerLazySingleton(
    () => UserRepository(
      remoteDataSource: getIt.get<UserRemoteDataSource>(),
      localDataSource: getIt.get<UserLocalDataSource>(),
    ),
  );
  // Auth
  getIt.registerLazySingleton(
    () => AuthRepository(
      remoteDataSource: getIt.get<AuthRemoteDataSource>(),
      localDataSource: getIt.get<AuthLocalDataSource>(),
    ),
  );
}
