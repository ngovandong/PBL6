import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';

class NameAndReviewInfo extends GetView<HotelDetailController> {
  const NameAndReviewInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.host.name,
              style: TextStyles.boldText.copyWith(fontSize: 22),
            ),
            Row(
              children: List.generate(
                controller.host.ratingStar,
                (index) => const Icon(
                  PhosphorIcons.star_fill,
                  color: Colors.yellow,
                ),
              ),
            )
          ],
        ),
        Container(
          width: 120,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Palette.blue300),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${controller.host.ratingFeedBack}',
                    style: TextStyles.s17BoldText,
                  ),
                  const Icon(
                    PhosphorIcons.thumbs_up_fill,
                    size: 17,
                    color: Colors.yellow,
                  ),
                ],
              ),
              Text(
                '${controller.host.quantityFeedBack} đánh giá',
                style: TextStyles.s14MediumText,
              )
            ],
          ),
        )
      ],
    );
  }
}
