import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';
import 'package:mobile/modules/hotel_detail/widgets/info_card.widget.dart';
import 'package:readmore/readmore.dart';

class DescriptionInfo extends GetView<HotelDetailController> {
  const DescriptionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Miêu tả',
            style: TextStyles.s17BoldText,
          ),
          const SizedBox(
            height: 6,
          ),
          ReadMoreText(
            controller.host.description,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Xem thêm',
            trimExpandedText: 'Ẩn thông tin',
            style: TextStyles.s14MediumText,
            lessStyle: TextStyles.s14BoldText.copyWith(color: Palette.blue300),
            moreStyle: TextStyles.s14BoldText.copyWith(color: Palette.blue300),
          ),
        ],
      ),
    );
  }
}
