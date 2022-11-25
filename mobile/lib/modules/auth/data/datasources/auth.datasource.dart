import 'package:injectable/injectable.dart';
import 'package:mobile/common/constants/endpoints.dart';
import 'package:mobile/common/utils/dio/dio_provider.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';

@lazySingleton
class AuthDataSource {
  Future<HttpRequestResponse> verifyWithEmail({
    required String email,
    String? password,
  }) async {
    Map<String, String> body = {
      'email': email,
    };

    if (password != null) {
      body.addAll({
        'password': password,
      });
    }

    final HttpRequestResponse response = await DioProvider.post(
      Endpoints.authWithEmail,
      body: body,
    );

    return response;
  }

  Future<UserModel> loginWithGoogle(String idToken) async {
    final HttpRequestResponse response = await DioProvider.post(
      Endpoints.authWithGoogle,
      body: {
        'idToken': idToken,
      },
    );

    return UserModel.fromJson(response.data);
  }
}
