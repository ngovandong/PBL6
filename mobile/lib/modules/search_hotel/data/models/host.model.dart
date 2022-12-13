import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/modules/search_hotel/data/models/accommodation.model.dart';

part 'host.model.g.dart';

@JsonSerializable(createToJson: false)
// @JsonSerializableDateTime()
class HostModel {
  final String id;
  final String name;
  final String description;
  final int ratingStar;
  final String hostType;
  final String country;
  final String province;
  final String address;
  final double latitude;
  final double longitude;
  final double area;
  final String avatarImage;
  final List<String> images;
  final bool parkingLot;
  final double parkingLotFee;
  final bool breakfast;
  final double breakfastFee;
  final List<String> outstandingUtilities;
  final bool extraBedService;
  final List<String> utilities;
  final bool currencyService;
  final String timeCheckin;
  final String timeCheckout;
  final double ratingFeedBack;
  final int quantityFeedBack;
  final List<AccommodationModel> accommodationSearches;

  HostModel({
    required this.id,
    required this.name,
    required this.description,
    this.ratingStar = 0,
    required this.hostType,
    required this.country,
    required this.province,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.area,
    required this.avatarImage,
    required this.images,
    required this.parkingLot,
    required this.parkingLotFee,
    required this.breakfast,
    required this.breakfastFee,
    required this.outstandingUtilities,
    required this.extraBedService,
    required this.utilities,
    required this.currencyService,
    required this.timeCheckin,
    required this.timeCheckout,
    required this.ratingFeedBack,
    required this.quantityFeedBack,
    required this.accommodationSearches,
  });

  factory HostModel.fromJson(Map<String, dynamic> json) =>
      _$HostModelFromJson(json);

  String get fullAddress => '$address, $province';

  AccommodationModel get cheapestRoom => accommodationSearches[0];
}
