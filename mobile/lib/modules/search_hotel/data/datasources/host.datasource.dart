import 'package:injectable/injectable.dart';
import 'package:mobile/common/constants/endpoints.dart';
import 'package:mobile/common/extensions/map.extension.dart';
import 'package:mobile/common/utils/dio/dio_provider.dart';
import 'package:mobile/modules/home/data/models/dtos/search_hotels.dto.dart';
import 'package:mobile/modules/search_hotel/data/models/dtos/host_detail.dto.dart';
import 'package:mobile/modules/search_hotel/data/models/host.model.dart';

@lazySingleton
class HostDataSource {
  Future<List<HostModel>> searchHosts(SearchHotelsDTO searchHotelsDTO) async {
    final Map<String, dynamic> response = (await DioProvider.get(
      Endpoints.searchHosts,
      queryParams:
          searchHotelsDTO.toJson().removeNullProperty as Map<String, dynamic>,
    ))
        .data;

    final List<HostModel> result = (response['hostSearches'] as List<dynamic>)
        .map((e) => HostModel.fromJson(e))
        .toList();

    for (var element in result) {
      element.accommodationSearches.sort((a, b) => a.price.compareTo(b.price));
    }

    return result;
  }

  Future<HostModel> getHostDetail(HostDetailDTO hostDetailDTO) async {
    final Map<String, dynamic> response = (await DioProvider.get(
      Endpoints.hostDetail,
      queryParams: hostDetailDTO.toJson(),
    ))
        .data;

    final HostModel host = HostModel.fromJson(response);
    host.accommodationSearches.sort((a, b) => a.price.compareTo(b.price));

    return host;
  }
}
