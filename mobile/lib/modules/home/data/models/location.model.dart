import 'package:json_annotation/json_annotation.dart';

part 'location.model.g.dart';

@JsonSerializable(createToJson: false)
class LocationModel {
  final String id;
  final String placeName;
  final String placeType;
  final String address;

  LocationModel({
    required this.id,
    required this.placeName,
    required this.placeType,
    required this.address,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}
