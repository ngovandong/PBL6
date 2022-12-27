import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:mobile/common/extensions/datetime.extension.dart';
import 'package:mobile/generated/locales.g.dart';
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
  final bool? requirePayment;
  bool? hasPayment;
  @JsonKey(name: 'bookingDetailDtos')
  final List<BookingDetailDTO> bookingDetails;

  @JsonKey(ignore: true)
  BookingHistoryType? type;

  bool get hasShowPaymentButton =>
      !hasPayment! &&
      (type == BookingHistoryType.PENDING ||
          type == BookingHistoryType.CURRENT);

  String get statusTitle {
    if (type == BookingHistoryType.COMPLETED ||
        type == BookingHistoryType.CANCEL) {
      return '';
    }

    if (!hasPayment!) {
      return LocaleKeys.booking_history_waiting_payment.tr;
    }

    if (type == BookingHistoryType.PENDING) {
      return LocaleKeys.booking_history_wating_confirm.tr;
    }

    return LocaleKeys.booking_history_confirmed.tr;
  }

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
    this.requirePayment,
    this.hasPayment,
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
      'bookingDetails': bookingDetails.map((e) => e.toJson()).toList(),
    };
  }

  factory BookingDTO.fromJson(Map<String, dynamic> json) =>
      _$BookingDTOFromJson(json);

  BookingDTO copyWith({
    String? id,
    String? bookingCode,
    DateTime? dateCheckin,
    DateTime? dateCheckout,
    String? hostId,
    String? hostName,
    String? avatarImage,
    String? province,
    String? userEmail,
    String? userFirstName,
    String? userLastName,
    String? userId,
    double? vatFee,
    double? totalPrice,
    String? note,
    bool? requirePayment,
    bool? hasPayment,
    List<BookingDetailDTO>? bookingDetails,
    BookingHistoryType? type,
  }) {
    return BookingDTO(
      id: id ?? this.id,
      bookingCode: bookingCode ?? this.bookingCode,
      dateCheckin: dateCheckin ?? this.dateCheckin,
      dateCheckout: dateCheckout ?? this.dateCheckout,
      hostId: hostId ?? this.hostId,
      hostName: hostName ?? this.hostName,
      avatarImage: avatarImage ?? this.avatarImage,
      province: province ?? this.province,
      userEmail: userEmail ?? this.userEmail,
      userFirstName: userFirstName ?? this.userFirstName,
      userLastName: userLastName ?? this.userLastName,
      userId: userId ?? this.userId,
      vatFee: vatFee ?? this.vatFee,
      totalPrice: totalPrice ?? this.totalPrice,
      note: note ?? this.note,
      requirePayment: requirePayment ?? this.requirePayment,
      hasPayment: hasPayment ?? this.hasPayment,
      bookingDetails: bookingDetails ?? this.bookingDetails,
      type: type ?? this.type,
    );
  }
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

@JsonSerializable(createToJson: false)
class PaymentSuccessDTO {
  final String userId;
  final String userName;
  final String hostId;
  final String hostName;
  final String bookingId;
  final String bookingCode;

  PaymentSuccessDTO({
    required this.userId,
    required this.userName,
    required this.hostId,
    required this.hostName,
    required this.bookingId,
    required this.bookingCode,
  });

  factory PaymentSuccessDTO.fromJson(Map<String, dynamic> json) =>
      _$PaymentSuccessDTOFromJson(json);
}
