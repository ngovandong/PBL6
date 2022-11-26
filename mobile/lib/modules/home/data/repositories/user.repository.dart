import 'package:mobile/modules/home/data/datasources/local/user.datasource.dart';
import 'package:mobile/modules/home/data/datasources/remote/user.datasource.dart';

class UserRepository {
  final UserLocalDataSource localDataSource;
  final UserRemoteDataSource remoteDataSource;

  UserRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });
}
