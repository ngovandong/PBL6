import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/modules/search_hotel/data/models/host.model.dart';

part 'host_search_response.dto.g.dart';

@JsonSerializable(createToJson: false)
class HostSearchResponseDTO {
  final String provinceName;
  final int totalResult;
  final List<HostModel> hostSearches;

  HostSearchResponseDTO({
    required this.provinceName,
    required this.totalResult,
    required this.hostSearches,
  }) {
    for (var element in hostSearches) {
      element.accommodationSearches.sort((a, b) => a.price.compareTo(b.price));
    }
  }

  factory HostSearchResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$HostSearchResponseDTOFromJson(json);
}
