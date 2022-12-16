import 'package:json_annotation/json_annotation.dart';

part 'favorite_host.model.g.dart';

@JsonSerializable(createToJson: false)
class FavoriteHostModel {
  final String id;
  final String hostId;
  final String hostName;
  final int ratingStar;
  final String address;
  final String avatarImage;

  FavoriteHostModel({
    required this.id,
    required this.hostId,
    required this.hostName,
    required this.ratingStar,
    required this.address,
    required this.avatarImage,
  });

  factory FavoriteHostModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteHostModelFromJson(json);
}
