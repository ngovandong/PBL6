// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostModel _$HostModelFromJson(Map<String, dynamic> json) => HostModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      ratingStar: json['ratingStar'] as int? ?? 0,
      hostType: json['hostType'] as String,
      country: json['country'] as String,
      province: json['province'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      area: (json['area'] as num).toDouble(),
      avatarImage: json['avatarImage'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      parkingLot: json['parkingLot'] as bool,
      parkingLotFee: (json['parkingLotFee'] as num).toDouble(),
      breakfast: json['breakfast'] as bool,
      breakfastFee: (json['breakfastFee'] as num).toDouble(),
      outstandingUtilities: (json['outstandingUtilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      extraBedService: json['extraBedService'] as bool,
      utilities:
          (json['utilities'] as List<dynamic>).map((e) => e as String).toList(),
      currencyService: json['currencyService'] as bool,
      timeCheckin: json['timeCheckin'] as String,
      timeCheckout: json['timeCheckout'] as String,
      ratingFeedBack: (json['ratingFeedBack'] as num).toDouble(),
      quantityFeedBack: json['quantityFeedBack'] as int,
      accommodationSearches: (json['accommodationSearches'] as List<dynamic>)
          .map((e) => AccommodationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
