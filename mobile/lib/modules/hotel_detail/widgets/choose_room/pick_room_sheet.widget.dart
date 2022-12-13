import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';

class PickNumberRoomSheet extends StatefulWidget {
  final int bookingQuantity;
  final int quantityAvailable;
  final Function(int) chooseRoom;

  const PickNumberRoomSheet({
    super.key,
    required this.bookingQuantity,
    required this.quantityAvailable,
    required this.chooseRoom,
  });

  @override
  State<PickNumberRoomSheet> createState() => _PickNumberRoomSheetState();
}

class _PickNumberRoomSheetState extends State<PickNumberRoomSheet> {
  late int numberOfRooms;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 250,
      padding: const EdgeInsets.only(
        left: UIConfigs.horizontalPadding,
        right: UIConfigs.horizontalPadding,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: CupertinoPicker(
                magnification: 1.22,
                squeeze: 1.2,
                useMagnifier: true,
                itemExtent: 35,
                onSelectedItemChanged: (int selectedItem) {
                  setState(() {
                    numberOfRooms = selectedItem;
                  });
                },
                scrollController: FixedExtentScrollController(
                  initialItem: widget.bookingQuantity,
                ),
                children: List<Widget>.generate(widget.quantityAvailable + 1,
                    (int index) {
                  return Center(
                    child: Text(
                      index == 0 ? 'Xoá' : '$index phòng',
                      style: TextStyles.s17MediumText,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AppRoundedButton(
              onPressed: () {
                widget.chooseRoom(numberOfRooms);
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
