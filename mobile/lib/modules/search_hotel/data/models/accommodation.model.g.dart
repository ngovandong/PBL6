// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodation.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccommodationModel _$AccommodationModelFromJson(Map<String, dynamic> json) =>
    AccommodationModel(
      id: json['id'] as String,
      name: json['name'] as String,
      accommodationType: json['accommodationType'] as String,
      bedTypes:
          (json['bedTypes'] as List<dynamic>).map((e) => e as String).toList(),
      outstandingUtilities: (json['outstandingUtilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
      quantityPersonFit: json['quantityPersonFit'] as int,
      quantityAvailable: json['quantityAvailable'] as int,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      area: (json['area'] as num).toDouble(),
      extraBed: json['extraBed'] as bool,
      bathRooms: json['bathRooms'] as int,
      bathRoomUtilities: (json['bathRoomUtilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      view: (json['view'] as List<dynamic>).map((e) => e as String).toList(),
      utilities:
          (json['utilities'] as List<dynamic>).map((e) => e as String).toList(),
      smoking: json['smoking'] as bool,
      vatFee: (json['vatFee'] as num?)?.toDouble() ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      isPrePayment: json['isPrePayment'] as bool,
      hostPartnerId: json['hostPartnerId'] as String,
    );
