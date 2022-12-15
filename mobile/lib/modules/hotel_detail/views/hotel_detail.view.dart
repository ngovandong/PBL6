import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/widgets/error_view.widget.dart';
import 'package:mobile/common/widgets/loading_dot.widget.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/bottom_button.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/detail_content.widget.dart';

class HotelDetailScreen extends GetView<HotelDetailController> {
  const HotelDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          switch (controller.getDataStatus.value) {
            case HandleStatus.HAS_DATA:
              return const DetailContent();
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
        },
      ),
      bottomNavigationBar: const BottomButton(),
    );
  }
}
