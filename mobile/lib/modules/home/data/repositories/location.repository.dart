import 'package:injectable/injectable.dart';
import 'package:mobile/modules/home/data/datasources/location.datasource.dart';
import 'package:mobile/modules/home/data/models/location.model.dart';

@lazySingleton
class LocationRepository {
  final LocationDataSource dataSource;

  LocationRepository({
    required this.dataSource,
  });

  Future<List<LocationModel>> getLocationSuggestions(String textSearch) {
    return dataSource.getLocationSuggestions(textSearch);
  }
}
