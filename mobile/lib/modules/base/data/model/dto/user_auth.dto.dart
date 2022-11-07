import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';

part 'user_auth.dto.g.dart';

@JsonSerializable()
class UserAuthDTO {
  final String id;
  final String? accessToken;

  UserAuthDTO({
    required this.id,
    required this.accessToken,
  });

  factory UserAuthDTO.fromJson(Map<String, dynamic> json) =>
      _$UserAuthDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthDTOToJson(this);

  factory UserAuthDTO.fromUserModel(UserModel user) {
    return UserAuthDTO(
      id: user.id,
      accessToken: user.accessToken,
    );
  }
}
