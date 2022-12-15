import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/utils/bed_content.util.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/pick_number_tenant_room.widget.dart';

class PickRoomAndBedSheet extends StatefulWidget {
  final int initNumberRoom;
  final String initBedType;
  final int quantityAvailable;
  final List<String> bedTypes;
  final Function(int, String) chooseRoom;

  const PickRoomAndBedSheet({
    super.key,
    this.initNumberRoom = 1,
    required this.initBedType,
    required this.quantityAvailable,
    required this.bedTypes,
    required this.chooseRoom,
  });

  @override
  State<PickRoomAndBedSheet> createState() => _PickRoomAndBedSheetState();
}

class _PickRoomAndBedSheetState extends State<PickRoomAndBedSheet> {
  late int numberOfRooms;
  late String selectedBedType;

  @override
  void initState() {
    numberOfRooms = widget.initNumberRoom;
    selectedBedType = widget.initBedType;
    super.initState();
  }

  void updateNumberOfRoom(bool isMinus) {
    setState(() {
      numberOfRooms -= isMinus ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 350,
      padding: const EdgeInsets.only(
        left: UIConfigs.horizontalPadding,
        right: UIConfigs.horizontalPadding,
        top: UIConfigs.horizontalPadding,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Số lượng phòng',
              style: TextStyles.s17BoldText,
            ),
            RowPickTenantOrRoom(
              number: numberOfRooms,
              title: 'Phòng',
              onMinus: () {
                updateNumberOfRoom(true);
              },
              onPlus: () {
                updateNumberOfRoom(false);
              },
              maxNumber: widget.quantityAvailable,
              minNumber: 0,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Loại giường',
              style: TextStyles.s17BoldText,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: widget.bedTypes.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final String bedItem = widget.bedTypes[index];

                return RadioListTile<String>(
                  title: Text(
                    BedContentUtil.getLabel(
                      bedItem,
                    ),
                    style: TextStyles.s14MediumText,
                  ),
                  contentPadding: EdgeInsets.zero,
                  value: bedItem,
                  groupValue: selectedBedType,
                  onChanged: (String? value) {
                    setState(() {
                      selectedBedType = bedItem;
                    });
                  },
                );
              },
            ),
            const Spacer(),
            AppRoundedButton(
              onPressed: () {
                widget.chooseRoom(numberOfRooms, selectedBedType);
                Get.back();
              },
              content: 'Chọn',
              fontSize: 15,
              showShadow: false,
              height: 45,
              backgroundColor: Palette.blue400,
            )
          ],
        ),
      ),
    );
  }
}
