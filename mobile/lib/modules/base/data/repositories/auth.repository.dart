import 'package:mobile/common/utils/dio/dio_provider.dart';
import 'package:mobile/modules/base/data/datasources/base_datasource.export.dart';
import 'package:mobile/modules/base/data/models/user.model.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<void> signUp(Map<String, dynamic> formBody) async {
    await remoteDataSource.signUp(formBody);
  }

  Future<void> forgotPassword(Map<String, dynamic> formBody) async {
    await remoteDataSource.forgotPassword(formBody);
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> formBody) async {
    final HttpRequestResponse requestResponse = await DioProvider.post(
      url: '/auth/login',
      formBody: formBody,
    );
    return requestResponse.data;
  }

  Future<UserModel?> getUserProfile() async {
    return await localDataSource.getUserProfile();
  }

  Future<void> setUserProfile(UserModel newUser) async {
    return await localDataSource.setUserProfile(newUser);
  }

  Future<void> setToken(String accessToken, String refreshToken) async {
    await localDataSource.setAccessToken(accessToken);
    await localDataSource.setRefreshToken(refreshToken);
  }

  Future<bool> checkNewUser() async {
    return await localDataSource.checkNewUser();
  }
}
