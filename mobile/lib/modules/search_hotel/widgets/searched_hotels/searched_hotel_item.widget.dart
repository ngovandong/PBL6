import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/image_slider.widget.dart';
import 'package:mobile/modules/search_hotel/controllers/search_hotel.controller.dart';
import 'package:mobile/modules/search_hotel/data/models/host.model.dart';

class SearchedHotelItem extends GetView<SearchHotelController> {
  final HostModel host;

  const SearchedHotelItem({super.key, required this.host});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        RouteManager.hotelDetail,
        arguments: host.id,
      ),
      child: Container(
        height: 380,
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
              images: host.images,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                host.name,
                style: TextStyles.s17BoldText,
              ),
            ),
            if (host.ratingStar > 0)
              Row(
                children: List.generate(
                  host.ratingStar,
                  (index) => const Icon(
                    PhosphorIcons.star_fill,
                    color: Colors.yellow,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  const Icon(
                    PhosphorIcons.map_pin_light,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    host.fullAddress,
                    style: TextStyles.s14RegularText,
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${host.ratingFeedBack} ',
                  style: TextStyles.s17BoldText,
                ),
                const Icon(
                  PhosphorIcons.thumbs_up_fill,
                  size: 17,
                  color: Colors.yellow,
                ),
                Text(
                  ' - ${host.quantityFeedBack} đánh giá',
                  style: TextStyles.s14RegularText
                      .copyWith(color: Palette.gray300),
                )
              ],
            ),
            const Divider(
              height: 12,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Phòng ${host.cheapestRoom.name}',
                        style: TextStyles.s14BoldText,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(
                              color: Palette.green500,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Text(
                            '2 phòng ngủ',
                            style: TextStyles.s14RegularText,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(
                              color: Palette.green500,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Text(
                            'View nhìn ra biển',
                            style: TextStyles.s14RegularText,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(
                              color: Palette.green500,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Text(
                            'Hồ bơi',
                            style: TextStyles.s14RegularText,
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 150,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 12,
                          color: Colors.black.withOpacity(0.1),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Palette.red400,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '3 ngày, 2 người',
                              style: TextStyles.s14RegularText
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              host.cheapestRoom.totalPrice.toMoneyFormat,
                              style: TextStyles.boldText.copyWith(
                                color: Palette.red400,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
