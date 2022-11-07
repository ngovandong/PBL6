import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/common/utils/dio/dio_provider.dart';
import 'package:mobile/modules/auth/auth.enum.dart';
import 'package:mobile/modules/auth/data/datasource/auth.datasource.dart';
import 'package:mobile/modules/auth/data/model/dtos/auth_response.dto.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';

@lazySingleton
class AuthRepository {
  final AuthDataSource dataSource;

  AuthRepository({
    required this.dataSource,
  });

  Future<AuthResponseDTO> verifyWithEmail({
    required String email,
    String? password,
  }) async {
    try {
      final HttpRequestResponse response =
          await dataSource.verifyWithEmail(email: email, password: password);

      return AuthResponseDTO(
        status: response.statusCode!,
        verifyResult: ErrorAuthentication.none,
        user: UserModel.fromJson(response.data),
      );
    } on DioError catch (dioError) {
      // log('DioError in verifyWithEmail: $dioError');

      final Response? response = dioError.response;

      if (response == null) {
        rethrow;
      } else {
        return AuthResponseDTO(
          status: response.statusCode!,
          verifyResult: response.data['error'].toString(),
        );
      }
    }
  }

  Future<UserModel> loginWithGoogle(String idToken) {
    return dataSource.loginWithGoogle(idToken);
  }
}
