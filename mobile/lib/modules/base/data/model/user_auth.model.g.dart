// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuthModel _$UserAuthModelFromJson(Map<String, dynamic> json) =>
    UserAuthModel(
      id: json['id'] as String,
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$UserAuthModelToJson(UserAuthModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accessToken': instance.accessToken,
    };
