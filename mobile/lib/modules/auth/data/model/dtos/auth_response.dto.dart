import 'package:mobile/modules/auth/data/model/user.model.dart';

class AuthResponseDTO {
  final int status;
  final String verifyResult;
  final UserModel? user;

  AuthResponseDTO({
    required this.status,
    required this.verifyResult,
    this.user,
  });
}
