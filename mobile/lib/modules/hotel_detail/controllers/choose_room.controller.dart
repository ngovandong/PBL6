import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';
import 'package:mobile/modules/search_hotel/data/models/accommodation.model.dart';
import 'package:mobile/modules/search_hotel/data/models/host.model.dart';

class ChooseRoomController extends GetxController {
  final HotelDetailController hotelDetailController;

  ChooseRoomController({
    required this.hotelDetailController,
  });

  final HostModel host = Get.arguments;

  late RxList<AccommodationModel> rooms;
  // final RxList<RoomModel> bookingRooms = <RoomModel>[].obs;

  final RxDouble totalMoneny = (0.0).obs;

  @override
  void onInit() {
    _getRoomData();
    rooms.listen((p0) {
      totalMoneny.value = p0
          .map((e) => e.price * e.bookingQuantity)
          .fold(0, (previousValue, element) => previousValue + element);
    });
    super.onInit();
  }

  void _getRoomData() {
    rooms = (host.accommodationSearches).obs;
  }

  void addRoom(String selectedRoomId) {
    final AccommodationModel currentRoom =
        rooms.firstWhere((p0) => p0.id == selectedRoomId);

    if (currentRoom.isSelected) {
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
                        currentRoom.quantityAvailable + 1, (int index) {
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
                      currentRoom.isSelected = false;
                      currentRoom.bookingQuantity = 0;
                    } else {
                      currentRoom.bookingQuantity = numberOfRooms;
                    }

                    rooms.refresh();
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
      currentRoom.isSelected = true;
      currentRoom.bookingQuantity = 1;
      rooms.refresh();
      update([selectedRoomId]);
    }
  }
}
