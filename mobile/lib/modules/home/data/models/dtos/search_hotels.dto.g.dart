// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hotels.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SearchHotelsDTOToJson(SearchHotelsDTO instance) =>
    <String, dynamic>{
      'searchText': instance.searchText,
      'searchType': instance.searchType,
      'quantityPerson': instance.quantityPerson,
      'stepNumber': instance.stepNumber,
      'ratingStar': instance.ratingStar,
      'ratingFeedback': instance.ratingFeedback,
      'DateCheckin':
          const JsonSerializableDateTime().toJson(instance.checkinDate),
      'DateCheckout':
          const JsonSerializableDateTime().toJson(instance.checkoutDate),
    };
