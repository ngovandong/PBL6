import 'package:json_annotation/json_annotation.dart';

part 'accommodation.model.g.dart';

@JsonSerializable(createToJson: false)
class AccommodationModel {
  final String id;
  final String name;
  final String accommodationType;
  final List<String> bedTypes;
  final List<String> outstandingUtilities;
  final String description;
  final int quantityAvailable;
  final double ratingFeedback;
  final int quantityFeedBack;
  final List<String> images;
  final double area;
  final bool extraBed;
  final int bathRooms;
  final List<String> bathRoomUtilities;
  final List<String> view;
  final List<String> utilities;
  final bool smoking;
  final double price;
  final bool isPrePayment;
  final String hostPartnerId;

  @JsonKey(ignore: true)
  int bookingQuantity;
  @JsonKey(ignore: true)
  bool isSelected;

  AccommodationModel({
    required this.id,
    required this.name,
    required this.accommodationType,
    required this.bedTypes,
    required this.outstandingUtilities,
    required this.description,
    required this.quantityAvailable,
    required this.ratingFeedback,
    required this.quantityFeedBack,
    required this.images,
    required this.area,
    required this.extraBed,
    required this.bathRooms,
    required this.bathRoomUtilities,
    required this.view,
    required this.utilities,
    required this.smoking,
    required this.price,
    required this.isPrePayment,
    required this.hostPartnerId,
    this.bookingQuantity = 0,
    this.isSelected = false,
  });

  factory AccommodationModel.fromJson(Map<String, dynamic> json) =>
      _$AccommodationModelFromJson(json);
}
