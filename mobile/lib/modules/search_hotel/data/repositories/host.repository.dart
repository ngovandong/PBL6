import 'package:injectable/injectable.dart';
import 'package:mobile/modules/home/data/models/dtos/search_hotels.dto.dart';
import 'package:mobile/modules/search_hotel/data/datasources/host.datasource.dart';
import 'package:mobile/modules/search_hotel/data/models/dtos/host_detail.dto.dart';
import 'package:mobile/modules/search_hotel/data/models/dtos/host_search_response.dto.dart';
import 'package:mobile/modules/search_hotel/data/models/host.model.dart';

@lazySingleton
class HostRepository {
  final HostDataSource dataSource;

  HostRepository({
    required this.dataSource,
  });

  Future<HostSearchResponseDTO> searchHosts(SearchHotelsDTO searchHotelsDTO) {
    return dataSource.searchHosts(searchHotelsDTO);
  }

  Future<HostModel> getHostDetail(HostDetailDTO hostDetailDTO) {
    return dataSource.getHostDetail(hostDetailDTO);
  }
}
