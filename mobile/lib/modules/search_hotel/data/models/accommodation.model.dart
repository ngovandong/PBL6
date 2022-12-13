import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/modules/hotel_detail/data/models/dtos/booking.dto.dart';

part 'accommodation.model.g.dart';

@JsonSerializable(createToJson: false)
class AccommodationModel {
  final String id;
  final String name;
  final String accommodationType;
  final List<String> bedTypes;
  final List<String> outstandingUtilities;
  final String description;
  final int quantityPersonFit;
  final int quantityAvailable;
  final List<String> images;
  final double area;
  final bool extraBed;
  final int bathRooms;
  final List<String> bathRoomUtilities;
  final List<String> view;
  final List<String> utilities;
  final bool smoking;
  final double vatFee;
  final double price;
  final bool isPrePayment;
  final String hostPartnerId;

  @JsonKey(ignore: true)
  int bookingQuantity;
  @JsonKey(ignore: true)
  bool isSelected;
  @JsonKey(ignore: true)
  String bedInfo;

  AccommodationModel({
    required this.id,
    required this.name,
    required this.accommodationType,
    required this.bedTypes,
    required this.outstandingUtilities,
    required this.description,
    required this.quantityPersonFit,
    required this.quantityAvailable,
    required this.images,
    required this.area,
    required this.extraBed,
    required this.bathRooms,
    required this.bathRoomUtilities,
    required this.view,
    required this.utilities,
    required this.smoking,
    this.vatFee = 0,
    this.price = 0,
    required this.isPrePayment,
    required this.hostPartnerId,
    this.bookingQuantity = 0,
    this.isSelected = false,
    this.bedInfo = '',
  });

  factory AccommodationModel.fromJson(Map<String, dynamic> json) =>
      _$AccommodationModelFromJson(json);

  List<String> get realUtilities {
    return outstandingUtilities.isEmpty ? utilities : outstandingUtilities;
  }

  double get totalPrice => vatFee + price;

  AccommodationModel copyWith({
    String? id,
    String? name,
    String? accommodationType,
    List<String>? bedTypes,
    List<String>? outstandingUtilities,
    String? description,
    int? quantityPersonFit,
    int? quantityAvailable,
    List<String>? images,
    double? area,
    bool? extraBed,
    int? bathRooms,
    List<String>? bathRoomUtilities,
    List<String>? view,
    List<String>? utilities,
    bool? smoking,
    double? vatFee,
    double? price,
    bool? isPrePayment,
    String? hostPartnerId,
    int? bookingQuantity,
    bool? isSelected,
    String? bedInfo,
  }) {
    return AccommodationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      accommodationType: accommodationType ?? this.accommodationType,
      bedTypes: bedTypes ?? this.bedTypes,
      outstandingUtilities: outstandingUtilities ?? this.outstandingUtilities,
      description: description ?? this.description,
      quantityPersonFit: quantityPersonFit ?? this.quantityPersonFit,
      quantityAvailable: quantityAvailable ?? this.quantityAvailable,
      images: images ?? this.images,
      area: area ?? this.area,
      extraBed: extraBed ?? this.extraBed,
      bathRooms: bathRooms ?? this.bathRooms,
      bathRoomUtilities: bathRoomUtilities ?? this.bathRoomUtilities,
      view: view ?? this.view,
      utilities: utilities ?? this.utilities,
      smoking: smoking ?? this.smoking,
      vatFee: vatFee ?? this.vatFee,
      price: price ?? this.price,
      isPrePayment: isPrePayment ?? this.isPrePayment,
      hostPartnerId: hostPartnerId ?? this.hostPartnerId,
      bookingQuantity: bookingQuantity ?? this.bookingQuantity,
      isSelected: isSelected ?? this.isSelected,
      bedInfo: bedInfo ?? this.bedInfo,
    );
  }

  BookingDetailDTO toBookingDetailDTO() {
    return BookingDetailDTO(
      quantity: bookingQuantity,
      bedInfo: bedInfo,
      accommodationId: id,
    );
  }
}
