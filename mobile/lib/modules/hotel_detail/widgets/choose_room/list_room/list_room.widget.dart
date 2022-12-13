import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/modules/hotel_detail/controllers/choose_room.controller.dart';
import 'package:mobile/modules/hotel_detail/widgets/choose_room/list_room/room_item.widget.dart';
import 'package:mobile/modules/search_hotel/data/models/accommodation.model.dart';

class ListRoom extends GetView<ChooseRoomController> {
  const ListRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
        itemCount: controller.rooms.length,
        physics: const ClampingScrollPhysics(),
        separatorBuilder: ((context, index) {
          return const SizedBox(
            height: 10,
          );
        }),
        itemBuilder: (context, index) {
          final AccommodationModel currentRoom = controller.rooms[index];

          return RoomItem(currentRoom: currentRoom);
        },
      ),
    );
  }
}
