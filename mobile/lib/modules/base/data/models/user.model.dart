import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String name;
  final String username;
  final String email;
  final String avatar;
  final String phone;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.phone,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
