import 'package:json_annotation/json_annotation.dart';

import 'package:mobile/common/utils/datetime.util.dart';

part 'search_hotels.dto.g.dart';

@JsonSerializable(explicitToJson: true, createFactory: false)
@JsonSerializableDateTime()
class SearchHotelsDTO {
  String searchText;
  String searchType;
  int quantityPerson;
  int stepNumber;
  @JsonKey(includeIfNull: false)
  int? ratingStar;
  @JsonKey(includeIfNull: false)
  int? ratingFeedback;
  @JsonKey(includeIfNull: false)
  List<String>? utilities;
  @JsonKey(name: 'DateCheckin')
  DateTime checkinDate;
  @JsonKey(name: 'DateCheckout')
  DateTime checkoutDate;
  // int numberOfTenants;
  // int numberOfRooms;

  SearchHotelsDTO({
    this.searchText = '',
    this.searchType = '',
    this.quantityPerson = 2,
    this.stepNumber = 1,
    this.ratingStar,
    this.ratingFeedback,
    required this.checkinDate,
    required this.checkoutDate,
    this.utilities,
    // this.numberOfTenants = 2,
    // this.numberOfRooms = 1,
  });

  Map<String, dynamic> toJson() => _$SearchHotelsDTOToJson(this);

  SearchHotelsDTO copyWith({
    String? searchText,
    String? searchType,
    int? quantityPerson,
    int? stepNumber,
    int? ratingStar,
    int? ratingFeedback,
    List<String>? utilities,
    DateTime? checkinDate,
    DateTime? checkoutDate,
  }) {
    return SearchHotelsDTO(
      searchText: searchText ?? this.searchText,
      searchType: searchType ?? this.searchType,
      quantityPerson: quantityPerson ?? this.quantityPerson,
      stepNumber: stepNumber ?? this.stepNumber,
      ratingStar: ratingStar ?? this.ratingStar,
      ratingFeedback: ratingFeedback ?? this.ratingFeedback,
      utilities: utilities ?? this.utilities,
      checkinDate: checkinDate ?? this.checkinDate,
      checkoutDate: checkoutDate ?? this.checkoutDate,
    );
  }
}
