import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/widgets/image_slider.widget.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/accommodation_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/date_tenant_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/description_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/location_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/name_review_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/policy_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/review_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/utilities_info.widget.dart';

class DetailContent extends GetView<HotelDetailController> {
  const DetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          ImageSlider(
            width: Get.width,
            height: 200,
            images: controller.host.images,
            borderRadius: 0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: UIConfigs.horizontalPadding,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const NameAndReviewInfo(),
                const SizedBox(
                  height: 10,
                ),
                const DateAndTenantInfo(),
                const SizedBox(
                  height: 10,
                ),
                const AccommodationsInfo(),
                const SizedBox(
                  height: 10,
                ),
                const LocationInfo(),
                const SizedBox(
                  height: 10,
                ),
                const ReviewInfo(),
                const SizedBox(
                  height: 10,
                ),
                UtilitiesInfo(
                  utilities: controller.host.outstandingUtilities,
                ),
                const SizedBox(
                  height: 10,
                ),
                const DescriptionInfo(),
                const SizedBox(
                  height: 10,
                ),
                const PolicyInfo(),
                const SizedBox(
                  height: UIConfigs.horizontalPadding,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
