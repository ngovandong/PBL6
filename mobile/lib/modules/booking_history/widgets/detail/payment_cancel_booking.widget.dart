import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/modules/booking_history/controllers/booking_history_detail.controller.dart';

class PaymentAndCancelBooking extends GetView<BookingHistoryDetailController> {
  const PaymentAndCancelBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tổng cộng',
              style: TextStyles.s17BoldText,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  controller.bookingParams.value.totalPrice!.toMoneyFormat,
                  style: TextStyles.s17BoldText.copyWith(color: Palette.red400),
                ),
                const Text('(Đã bao gồm thuế và phí)')
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Obx(
          () => Visibility(
            visible: controller.bookingParams.value.hasShowPaymentButton,
            child: Column(
              children: [
                AppRoundedButton(
                  onPressed: controller.submitPaymentBooking,
                  showShadow: false,
                  showBorder: true,
                  backgroundColor: Colors.white,
                  borderColor: Palette.red500,
                  textColor: Palette.red500,
                  borderRadius: 0,
                  content: 'Thanh toán',
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
        if (controller.bookingParams.value.canCancel)
          AppRoundedButton(
            onPressed: controller.cancelBooking,
            showShadow: false,
            showBorder: true,
            backgroundColor: Colors.white,
            borderColor: Palette.red500,
            textColor: Palette.red500,
            borderRadius: 0,
            content: 'Huỷ đặt phòng',
          )
      ],
    );
  }
}
