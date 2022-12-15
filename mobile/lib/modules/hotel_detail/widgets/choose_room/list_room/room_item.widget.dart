import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/image_slider.widget.dart';
import 'package:mobile/modules/hotel_detail/controllers/choose_room.controller.dart';
import 'package:mobile/modules/hotel_detail/widgets/choose_room/list_room/feature_price.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/choose_room/list_room/room_utilities.widget.dart';
import 'package:mobile/modules/search_hotel/data/models/accommodation.model.dart';

class RoomItem extends GetView<ChooseRoomController> {
  final AccommodationModel currentRoom;

  const RoomItem({
    super.key,
    required this.currentRoom,
  });

  String getButtonTitle() {
    if (currentRoom.isSelected) {
      return '${currentRoom.bookingQuantity} phòng';
    } else {
      if (currentRoom.bedTypes.length == 1) {
        return 'Chọn';
      }
      return 'Chọn và tùy chỉnh';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Palette.gray100),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSlider(
            height: 150,
            images: currentRoom.images,
          ),
          FeaturePrice(currentRoom: currentRoom),
          const Divider(
            height: 0,
          ),
          const SizedBox(
            height: 10,
          ),
          RoomUtilities(currentRoom: currentRoom),
          const SizedBox(height: 10),
          GetBuilder<ChooseRoomController>(
            id: currentRoom.id,
            builder: (_) {
              return AppRoundedButton(
                height: 45,
                onPressed: () {
                  controller.addRoom(currentRoom.id);
                },
                content: getButtonTitle(),
                suffixIcon: currentRoom.isSelected == false
                    ? null
                    : const Icon(
                        PhosphorIcons.caret_down,
                        color: Colors.white,
                      ),
                showShadow: false,
                fontSize: 14,
                showBorder: !currentRoom.isSelected,
                backgroundColor:
                    currentRoom.isSelected ? Palette.blue300 : Colors.white,
                textColor:
                    currentRoom.isSelected ? Colors.white : Palette.blue300,
              );
            },
          )
        ],
      ),
    );
  }
}
