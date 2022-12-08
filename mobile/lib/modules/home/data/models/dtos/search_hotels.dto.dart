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
  int? ratingStar;
  int? ratingFeedback;
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
    // this.numberOfTenants = 2,
    // this.numberOfRooms = 1,
  });

  Map<String, dynamic> toJson() => _$SearchHotelsDTOToJson(this);
}
