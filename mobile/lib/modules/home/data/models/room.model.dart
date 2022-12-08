import 'package:json_annotation/json_annotation.dart';

class RoomModel {
  final int id;
  final String name;
  final double price;
  final int availableQuantity;

  @JsonKey(ignore: true)
  int bookingQuantity;
  @JsonKey(ignore: true)
  bool isSelected;

  RoomModel({
    required this.id,
    required this.name,
    required this.price,
    required this.availableQuantity,
    this.bookingQuantity = 0,
    this.isSelected = false,
  });

  RoomModel copyWith({
    int? id,
    String? name,
    double? price,
    int? availableQuantity,
    int? bookingQuantity,
  }) {
    return RoomModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      availableQuantity: availableQuantity ?? this.availableQuantity,
      bookingQuantity: bookingQuantity ?? this.bookingQuantity,
    );
  }
}
