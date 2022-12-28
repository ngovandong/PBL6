import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/utils/bed_content.util.dart';
import 'package:mobile/modules/hotel_detail/controllers/choose_room.controller.dart';
import 'package:mobile/common/widgets/icon_title.widget.dart';
import 'package:mobile/modules/search_hotel/data/models/accommodation.model.dart';

class FeaturePrice extends GetView<ChooseRoomController> {
  final AccommodationModel currentRoom;

  const FeaturePrice({
    super.key,
    required this.currentRoom,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentRoom.name,
                  style: TextStyles.s17BoldText,
                ),
                const SizedBox(
                  height: 6,
                ),
                IconTitle(
                  icon: PhosphorIcons.arrows_out,
                  title: 'Kích cỡ: ${currentRoom.area} m\u00B2',
                ),
                const SizedBox(
                  height: 6,
                ),
                IconTitle(
                  icon: PhosphorIcons.user,
                  title: 'Phù hợp cho ${currentRoom.quantityPersonFit} người',
                ),
                const SizedBox(
                  height: 6,
                ),
                IconTitle(
                  icon: Icons.sell_outlined,
                  title: currentRoom.isPrePayment
                      ? 'Thanh toán trước'
                      : 'Không cần thanh toán trước',
                  textStyle:
                      TextStyles.s14BoldText.copyWith(color: Palette.red500),
                ),
                if (currentRoom.bedTypes.length == 1)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: IconTitle(
                      icon: Icons.single_bed_outlined,
                      title: BedContentUtil.getLabel(
                        currentRoom.bedTypes.first,
                      ),
                    ),
                  ),
                if (controller.host.breakfast)
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: IconTitle(
                      icon: Icons.restaurant_outlined,
                      title: 'Có bữa sáng',
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currentRoom.totalPrice.toMoneyFormat,
                style: TextStyles.boldText.copyWith(
                  color: Palette.red400,
                  fontSize: 18,
                ),
              ),
              const Text(
                '(Đã bao gồm thuế và phí)',
                style: TextStyles.s14MediumText,
              ),
            ],
          )
        ],
      ),
    );
  }
}
