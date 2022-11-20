// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_host.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteHostModel _$FavoriteHostModelFromJson(Map<String, dynamic> json) =>
    FavoriteHostModel(
      hostId: json['hostId'] as String,
      hostName: json['hostName'] as String,
      ratingStar: json['ratingStar'] as int,
      address: json['address'] as String,
      avatarImage: json['avatarImage'] as String,
    );

Map<String, dynamic> _$FavoriteHostModelToJson(FavoriteHostModel instance) =>
    <String, dynamic>{
      'hostId': instance.hostId,
      'hostName': instance.hostName,
      'ratingStar': instance.ratingStar,
      'address': instance.address,
      'avatarImage': instance.avatarImage,
    };
