import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/common/extensions/datetime.extension.dart';
import 'package:mobile/modules/booking_history/booking_history.enum.dart';

part 'booking.dto.g.dart';

@JsonSerializable(createToJson: false)
class BookingDTO {
  @JsonKey(includeIfNull: false)
  final String? id;
  @JsonKey(includeIfNull: false)
  final String? bookingCode;
  final DateTime dateCheckin;
  final DateTime dateCheckout;
  final String hostId;
  @JsonKey(includeIfNull: false)
  final String? hostName;
  @JsonKey(includeIfNull: false)
  final String? avatarImage;
  @JsonKey(includeIfNull: false)
  final String? province;
  final String userEmail;
  final String userFirstName;
  final String userLastName;
  final String userId;
  @JsonKey(includeIfNull: false)
  final double? vatFee;
  @JsonKey(includeIfNull: false)
  final double? totalPrice;
  final String note;
  final bool isPrePayment;
  @JsonKey(name: 'bookingDetailDtos')
  final List<BookingDetailDTO> bookingDetails;

  @JsonKey(ignore: true)
  BookingHistoryType? type;

  String get displayDate =>
      '${dateCheckin.toDisplayDate} - ${dateCheckout.toDisplayDate}';

  bool get canCancel => (type == BookingHistoryType.PENDING ||
      type == BookingHistoryType.CURRENT);

  BookingDTO({
    this.id,
    this.bookingCode,
    required this.dateCheckin,
    required this.dateCheckout,
    required this.hostId,
    this.hostName,
    this.avatarImage,
    this.province,
    required this.userEmail,
    required this.userFirstName,
    required this.userLastName,
    required this.userId,
    this.vatFee,
    this.totalPrice,
    required this.note,
    required this.isPrePayment,
    required this.bookingDetails,
    this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      'dateCheckin': dateCheckin.toIso8601String(),
      'dateCheckout': dateCheckout.toIso8601String(),
      'hostId': hostId,
      'userEmail': userEmail,
      'userFirstName': userFirstName,
      'userLastName': userLastName,
      'userId': userId,
      'note': note,
      'isPrePayment': isPrePayment,
      'bookingDetails': bookingDetails.map((e) => e.toJson()).toList(),
    };
  }

  factory BookingDTO.fromJson(Map<String, dynamic> json) =>
      _$BookingDTOFromJson(json);
}

@JsonSerializable()
class BookingDetailDTO {
  @JsonKey(includeIfNull: false)
  final String? id;
  final int quantity;
  final String bedInfo;
  @JsonKey(includeIfNull: false)
  final double? priceUnit;
  @JsonKey(includeIfNull: false)
  final String? accommodationName;
  final String accommodationId;
  @JsonKey(includeIfNull: false)
  final String? bookingId;

  BookingDetailDTO({
    this.id,
    required this.quantity,
    required this.bedInfo,
    this.priceUnit,
    this.accommodationName,
    required this.accommodationId,
    this.bookingId,
  });

  Map<String, dynamic> toJson() => _$BookingDetailDTOToJson(this);

  factory BookingDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailDTOFromJson(json);
}
