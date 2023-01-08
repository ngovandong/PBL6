import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/confirm_and_pin_code.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/common/widgets/hotel_info_card.widget.dart';
import 'package:mobile/modules/hotel_detail/controllers/confirm_booking.controller.dart';

class ConfirmBookingView extends GetView<ConfirmBookingController> {
  const ConfirmBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasBackIcon: true,
        title: Text(
          'Xác nhận đặt phòng',
          style: TextStyles.s14BoldText.copyWith(color: Colors.white),
        ),
        backgroundColor: Palette.blue400,
        onLeadingAction: () {
          Get.until(ModalRoute.withName(RouteManager.root));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                // controller.createBookingParams.value.requirePayment!
                //     ? LocaleKeys.booking_history_waiting_payment.tr
                //     : LocaleKeys.booking_history_wating_confirm.tr,
                controller.bookingInfo.value.statusTitle,
                style: TextStyles.s17BoldText.copyWith(color: Palette.green700),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ConfirmAndPinCode(
              confirmCode: controller.bookingInfo.value.bookingCode!,
              pinCode: '2181',
            ),
            const SizedBox(
              height: 10,
            ),
            HotelInfoCard(
              bookingParams: controller.bookingInfo.value,
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => Visibility(
                visible: controller.bookingInfo.value.hasShowPaymentButton,
                child: AppRoundedButton(
                  onPressed: controller.submitPaymentBooking,
                  showShadow: false,
                  showBorder: true,
                  backgroundColor: Colors.white,
                  borderColor: Palette.red500,
                  textColor: Palette.red500,
                  borderRadius: 0,
                  content: 'Thanh toán ngay',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
