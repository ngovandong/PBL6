// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      familyName: json['familyName'] as String?,
      givenName: json['givenName'] as String?,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      gender: json['gender'] as String?,
      avatarImageUrl: json['avatarImageUrl'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      birthDay: _$JsonConverterFromJson<String, DateTime>(
          json['birthDay'], const JsonSerializableDateTime().fromJson),
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'familyName': instance.familyName,
      'givenName': instance.givenName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
      'avatarImageUrl': instance.avatarImageUrl,
      'address': instance.address,
      'country': instance.country,
      'birthDay': _$JsonConverterToJson<String, DateTime>(
          instance.birthDay, const JsonSerializableDateTime().toJson),
      'accessToken': instance.accessToken,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
