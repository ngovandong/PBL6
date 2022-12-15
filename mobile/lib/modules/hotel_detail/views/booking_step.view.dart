import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/modules/hotel_detail/controllers/booking_step.controller.dart';
import 'package:mobile/modules/hotel_detail/controllers/choose_room.controller.dart';
import 'package:mobile/modules/hotel_detail/widgets/booking_step/booking_payment.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/booking_step/booking_total_price.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/booking_step/date_person_booking_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/booking_step/hotel_basic_info.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/booking_step/list_booking_room.widget.dart';

class BookingStepView extends GetView<BookingStepController> {
  final ChooseRoomController _chooseRoomController =
      Get.find<ChooseRoomController>();

  BookingStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: GestureDetector(
          onTap: () {},
          child: Column(
            children: const [
              Text(
                'Đặt phòng',
                style: TextStyles.s17BoldText,
              ),
            ],
          ),
        ),
        hasBackIcon: true,
        elevation: 2,
        leadingBackgroundColor: Palette.background,
        backIconColor: Palette.zodiacBlue,
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.symmetric(vertical: UIConfigs.horizontalPadding),
        child: Column(
          children: [
            HotelBasicInfo(),
            const SizedBox(
              height: UIConfigs.horizontalPadding,
            ),
            DatePersonBookingInfo(),
            const SizedBox(
              height: UIConfigs.horizontalPadding,
            ),
            ListBookingRoom(),
            const SizedBox(
              height: UIConfigs.horizontalPadding,
            ),
            BookingTotalPrice(),
            const SizedBox(
              height: UIConfigs.horizontalPadding,
            ),
            const BookingPayment(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Text(
                _chooseRoomController.totalMoneny.value.toMoneyFormat,
                style: TextStyles.s17BoldText.copyWith(color: Palette.red500),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: AppRoundedButton(
                  onPressed: controller.createBooking,
                  content: 'Đặt phòng',
                  fontSize: 15,
                  showShadow: false,
                  backgroundColor: Palette.red500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
