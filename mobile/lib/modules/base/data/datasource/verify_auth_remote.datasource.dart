import 'package:injectable/injectable.dart';
import 'package:mobile/common/constants/endpoints.dart';
import 'package:mobile/common/utils/dio/dio_provider.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';

@lazySingleton
class VeriryAuthRemoteDataSource {
  Future<UserModel> getUserInfo(String userId) async {
    final HttpRequestResponse response =
        await DioProvider.get('${Endpoints.user}/$userId/user-info');

    return UserModel.fromJson(response.data);
  }
}
