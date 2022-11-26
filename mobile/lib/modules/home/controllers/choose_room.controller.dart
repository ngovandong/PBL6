import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/modules/home/data/models/room.model.dart';

class ChooseRoomController extends GetxController {
  @override
  void onInit() {
    bookingRooms.listen((p0) {
      totalMoneny.value = p0
          .map((e) => e.price * e.bookingQuantity)
          .fold(0, (previousValue, element) => previousValue + element);
    });
    super.onInit();
  }

  final List<RoomModel> rooms = [
    RoomModel(
      id: 0,
      name: 'Phòng superior',
      price: 400000,
      availableQuantity: 2,
    ),
    RoomModel(
      id: 1,
      name: 'Phòng superior',
      price: 912000,
      availableQuantity: 4,
    ),
    RoomModel(
      id: 2,
      name: 'Phòng superior',
      price: 956000,
      availableQuantity: 3,
    )
  ];
  final RxList<RoomModel> bookingRooms = <RoomModel>[].obs;

  final RxDouble totalMoneny = (0.0).obs;

  void addRoom(int selectedRoomId) {
    final RoomModel? currentRoom =
        bookingRooms.firstWhereOrNull((p0) => p0.id == selectedRoomId);

    if (currentRoom != null) {
      int numberOfRooms = 0;

      Get.bottomSheet(
        Container(
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
                      numberOfRooms = selectedItem;
                    },
                    scrollController: FixedExtentScrollController(
                      initialItem: currentRoom.bookingQuantity,
                    ),
                    children: List<Widget>.generate(
                        currentRoom.availableQuantity + 1, (int index) {
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
                    if (numberOfRooms == 0) {
                      bookingRooms.removeWhere(
                        (element) => element.id == selectedRoomId,
                      );
                    } else {
                      currentRoom.bookingQuantity = numberOfRooms;
                      bookingRooms.refresh();
                    }

                    update([selectedRoomId]);

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
        ),
      );
    } else {
      bookingRooms.add(
        rooms.firstWhere((element) => element.id == selectedRoomId).copyWith()
          ..bookingQuantity = 1,
      );
      update([selectedRoomId]);
    }
  }
}
