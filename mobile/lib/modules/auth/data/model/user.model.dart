import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel {
  final String id;
  final String? familyName;
  final String? givenName;
  final String email;
  final String? phoneNumber;
  final String? gender;
  final String? avatarImageUrl;
  final String? address;
  final String? country;
  final String? birthDay;
  final String? accessToken;

  UserModel({
    required this.id,
    this.familyName,
    this.givenName,
    required this.email,
    this.phoneNumber,
    this.gender,
    this.avatarImageUrl,
    this.address,
    this.country,
    this.birthDay,
    this.accessToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
