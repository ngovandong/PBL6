import 'package:injectable/injectable.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';
import 'package:mobile/modules/base/data/datasource/verify_auth_local.datasource.dart';
import 'package:mobile/modules/base/data/datasource/verify_auth_remote.datasource.dart';
import 'package:mobile/modules/base/data/model/dto/user_auth.dto.dart';

@lazySingleton
class VeriryAuthRepository {
  final VeriryAuthRemoteDataSource remoteDataSource;
  final VerifyAuthLocalDataSource localDataSource;

  VeriryAuthRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<UserModel> getUserInfo(String userId) {
    return remoteDataSource.getUserInfo(userId);
  }

  Future<UserAuthDTO?> getUserAuth() {
    return localDataSource.getUserAuth();
  }

  Future<void> saveUserAuth(UserAuthDTO? userAuth) {
    return localDataSource.saveUserAuth(userAuth);
  }
}
