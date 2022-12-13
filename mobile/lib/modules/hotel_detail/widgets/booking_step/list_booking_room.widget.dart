import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/modules/hotel_detail/controllers/choose_room.controller.dart';
import 'package:mobile/modules/search_hotel/data/models/accommodation.model.dart';

class ListBookingRoom extends StatelessWidget {
  final ChooseRoomController _chooseRoomController =
      Get.find<ChooseRoomController>();

  ListBookingRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding:
          const EdgeInsets.symmetric(horizontal: UIConfigs.horizontalPadding),
      child: ListView.separated(
        itemCount: _chooseRoomController.bookingRooms.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
        itemBuilder: (context, index) {
          final AccommodationModel accommodationModel =
              _chooseRoomController.bookingRooms[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      accommodationModel.name,
                      style: TextStyles.s17BoldText,
                    ),
                    Text(
                      'Số lượng: ${accommodationModel.bookingQuantity}',
                      style: TextStyles.s14RegularText
                          .copyWith(color: Palette.gray300),
                    )
                  ],
                ),
                const Icon(Icons.chevron_right_rounded)
              ],
            ),
          );
        },
      ),
    );
  }
}
