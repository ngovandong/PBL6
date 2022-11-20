import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';

part 'user_auth.model.g.dart';

@JsonSerializable()
class UserAuthModel {
  final String id;
  final String? accessToken;

  UserAuthModel({
    required this.id,
    required this.accessToken,
  });

  factory UserAuthModel.fromJson(Map<String, dynamic> json) =>
      _$UserAuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthModelToJson(this);

  factory UserAuthModel.fromUserModel(UserModel user) {
    return UserAuthModel(
      id: user.id,
      accessToken: user.accessToken,
    );
  }
}
