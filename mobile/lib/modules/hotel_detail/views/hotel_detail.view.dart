import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/error_view.widget.dart';
import 'package:mobile/common/widgets/loading_dot.widget.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';
import 'package:mobile/modules/hotel_detail/widgets/bottom_button.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/date_tenant_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/description_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/hotel_detail_header.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/location_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/name_review_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/policy_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/review_infor.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/utilities_info.widget.dart';

class HotelDetailScreen extends GetView<HotelDetailController> {
  const HotelDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: UIConfigs.horizontalPadding,
            right: UIConfigs.horizontalPadding,
            top: MediaQuery.of(context).padding.top,
          ),
          child: Obx(() {
            switch (controller.getDataStatus.value) {
              case HandleStatus.HAS_DATA:
                return Column(
                  children: [
                    const HotelDetailHeader(),
                    const NameAndReviewInfo(),
                    const DateAndTenantInfo(),
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
                  ],
                );
              case HandleStatus.LOADING:
                return const Center(
                  child: LoadingDot(
                    dotColor: Palette.blue400,
                  ),
                );
              case HandleStatus.HAS_ERROR:
                return const ErrorBanner();
              case HandleStatus.NORMAL:
                return const SizedBox();
            }
          }),
        ),
      ),
      bottomNavigationBar: const BottomButton(),
    );
  }
}
