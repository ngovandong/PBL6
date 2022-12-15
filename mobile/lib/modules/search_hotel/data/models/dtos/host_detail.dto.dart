import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/common/utils/datetime.util.dart';

part 'host_detail.dto.g.dart';

@JsonSerializable(explicitToJson: true, createFactory: false)
@JsonSerializableDateTime()
class HostDetailDTO {
  String id;
  DateTime dateCheckin;
  DateTime dateCheckout;
  int quantiyPerson;

  HostDetailDTO({
    required this.id,
    required this.dateCheckin,
    required this.dateCheckout,
    this.quantiyPerson = 2,
  });

  Map<String, dynamic> toJson() => _$HostDetailDTOToJson(this);
}
