import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/confirm_and_pin_code.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/common/widgets/icon_title.widget.dart';
import 'package:mobile/modules/booking_history/controllers/booking_history_detail.controller.dart';
import 'package:mobile/modules/booking_history/widgets/detail/list_booking_history_room.widget.dart';
import 'package:mobile/modules/booking_history/widgets/detail/payment_cancel_booking.widget.dart';

class BookingHistoryDetailView extends GetView<BookingHistoryDetailController> {
  const BookingHistoryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasBackIcon: true,
        title: Text(
          'Thông tin đặt phòng',
          style: TextStyles.s14BoldText.copyWith(color: Colors.white),
        ),
        backgroundColor: Palette.blue400,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Visibility(
                  visible:
                      controller.bookingParams.value.statusTitle.isNotEmpty,
                  child: Text(
                    controller.bookingParams.value.statusTitle,
                    style: TextStyles.s17BoldText
                        .copyWith(color: Palette.green700),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ConfirmAndPinCode(
                confirmCode: controller.bookingParams.value.bookingCode!,
                pinCode: '2181',
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                controller.bookingParams.value.hostName!,
                style: TextStyles.s17BoldText,
              ),
              const SizedBox(
                height: 10,
              ),
              IconTitle(
                icon: PhosphorIcons.calendar_check,
                title: controller.bookingParams.value.displayDate,
              ),
              const SizedBox(
                height: 10,
              ),
              IconTitle(
                icon: PhosphorIcons.map_pin,
                title: controller.bookingParams.value.province,
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 0,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Bạn đã đặt ${controller.bookingParams.value.bookingDetails.length} phòng',
                style: TextStyles.s17BoldText,
              ),
              const SizedBox(
                height: 10,
              ),
              const ListBookingHistoryRoom(),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 0,
              ),
              const SizedBox(
                height: 10,
              ),
              const PaymentAndCancelBooking(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
