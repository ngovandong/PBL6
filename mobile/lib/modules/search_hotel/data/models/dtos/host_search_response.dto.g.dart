// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_search_response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostSearchResponseDTO _$HostSearchResponseDTOFromJson(
        Map<String, dynamic> json) =>
    HostSearchResponseDTO(
      provinceName: json['provinceName'] as String,
      totalResult: json['totalResult'] as int,
      hostSearches: (json['hostSearches'] as List<dynamic>)
          .map((e) => HostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
