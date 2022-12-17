// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hotels.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SearchHotelsDTOToJson(SearchHotelsDTO instance) {
  final val = <String, dynamic>{
    'searchText': instance.searchText,
    'searchType': instance.searchType,
    'quantityPerson': instance.quantityPerson,
    'stepNumber': instance.stepNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ratingStar', instance.ratingStar);
  writeNotNull('ratingFeedback', instance.ratingFeedback);
  writeNotNull('utilities', instance.utilities);
  val['DateCheckin'] =
      const JsonSerializableDateTime().toJson(instance.checkinDate);
  val['DateCheckout'] =
      const JsonSerializableDateTime().toJson(instance.checkoutDate);
  val['numberOfDate'] = instance.numberOfDate;
  return val;
}
