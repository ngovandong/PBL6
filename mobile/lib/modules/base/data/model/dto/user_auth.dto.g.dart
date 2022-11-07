// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuthDTO _$UserAuthDTOFromJson(Map<String, dynamic> json) => UserAuthDTO(
      id: json['id'] as String,
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$UserAuthDTOToJson(UserAuthDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accessToken': instance.accessToken,
    };
