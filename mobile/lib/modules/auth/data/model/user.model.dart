import 'package:json_annotation/json_annotation.dart';

import 'package:mobile/common/utils/datetime.util.dart';

part 'user.model.g.dart';

@JsonSerializable()
@JsonSerializableDateTime()
class UserModel {
  final String id;
  String? familyName;
  String? givenName;
  final String email;
  String? phoneNumber;
  String? gender;
  final String? avatarImageUrl;
  String? address;
  final String? country;
  DateTime? birthDay;
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

  String get fullName => '${familyName ?? ''} ${givenName ?? ''}';

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? familyName,
    String? givenName,
    String? email,
    String? phoneNumber,
    String? gender,
    String? avatarImageUrl,
    String? address,
    String? country,
    DateTime? birthDay,
    String? accessToken,
  }) {
    return UserModel(
      id: id ?? this.id,
      familyName: familyName ?? this.familyName,
      givenName: givenName ?? this.givenName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      avatarImageUrl: avatarImageUrl ?? this.avatarImageUrl,
      address: address ?? this.address,
      country: country ?? this.country,
      birthDay: birthDay ?? this.birthDay,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.familyName == familyName &&
        other.givenName == givenName &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.gender == gender &&
        other.avatarImageUrl == avatarImageUrl &&
        other.address == address &&
        other.country == country &&
        other.birthDay == birthDay &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        familyName.hashCode ^
        givenName.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        gender.hashCode ^
        avatarImageUrl.hashCode ^
        address.hashCode ^
        country.hashCode ^
        birthDay.hashCode ^
        accessToken.hashCode;
  }

  Map<String, dynamic> toHttpJson() {
    return {
      'id': id,
      'familyName': familyName,
      'givenName': givenName,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'avatarImageUrl': avatarImageUrl,
      'address': address,
      'country': country,
      'birthDay': _$JsonConverterToJson<String, DateTime>(
        birthDay,
        const JsonSerializableDateTime().toJson,
      ),
    };
  }
}
