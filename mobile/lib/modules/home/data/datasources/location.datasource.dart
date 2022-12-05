import 'dart:core';

import 'package:injectable/injectable.dart';
import 'package:mobile/common/constants/endpoints.dart';
import 'package:mobile/common/utils/dio/dio_provider.dart';
import 'package:mobile/modules/home/data/models/location.model.dart';

@lazySingleton
class LocationDataSource {
  Future<List<LocationModel>> getLocationSuggestions(
    String textSearch,
  ) async {
    final List<dynamic> rawData = (await DioProvider.get(
      Endpoints.locationSuggestions,
      queryParams: {
        'textSearch': textSearch,
      },
    ))
        .data;

    return rawData.map((e) => LocationModel.fromJson(e)).toList();
  }
}
