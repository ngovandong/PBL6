// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDTO _$BookingDTOFromJson(Map<String, dynamic> json) => BookingDTO(
      id: json['id'] as String?,
      bookingCode: json['bookingCode'] as String?,
      dateCheckin: DateTime.parse(json['dateCheckin'] as String),
      dateCheckout: DateTime.parse(json['dateCheckout'] as String),
      hostId: json['hostId'] as String,
      hostName: json['hostName'] as String?,
      avatarImage: json['avatarImage'] as String?,
      province: json['province'] as String?,
      userEmail: json['userEmail'] as String,
      userFirstName: json['userFirstName'] as String,
      userLastName: json['userLastName'] as String,
      userId: json['userId'] as String,
      vatFee: (json['vatFee'] as num?)?.toDouble(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      note: json['note'] as String,
      isPrePayment: json['isPrePayment'] as bool,
      bookingDetails: (json['bookingDetailDtos'] as List<dynamic>)
          .map((e) => BookingDetailDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

BookingDetailDTO _$BookingDetailDTOFromJson(Map<String, dynamic> json) =>
    BookingDetailDTO(
      id: json['id'] as String?,
      quantity: json['quantity'] as int,
      bedInfo: json['bedInfo'] as String,
      priceUnit: (json['priceUnit'] as num?)?.toDouble(),
      accommodationName: json['accommodationName'] as String?,
      accommodationId: json['accommodationId'] as String,
      bookingId: json['bookingId'] as String?,
    );

Map<String, dynamic> _$BookingDetailDTOToJson(BookingDetailDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['quantity'] = instance.quantity;
  val['bedInfo'] = instance.bedInfo;
  writeNotNull('priceUnit', instance.priceUnit);
  writeNotNull('accommodationName', instance.accommodationName);
  val['accommodationId'] = instance.accommodationId;
  writeNotNull('bookingId', instance.bookingId);
  return val;
}
