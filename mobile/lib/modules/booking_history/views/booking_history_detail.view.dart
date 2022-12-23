import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/utils/bed_content.util.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/confirm_and_pin_code.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/common/widgets/icon_title.widget.dart';
import 'package:mobile/modules/booking_history/controllers/booking_history_detail.controller.dart';
import 'package:mobile/modules/booking_history/data/models/booking.dto.dart';

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
              Text(
                'Đặt chỗ của bạn đã được xác nhận!',
                style: TextStyles.s17BoldText.copyWith(color: Palette.green700),
              ),
              const SizedBox(
                height: 10,
              ),
              ConfirmAndPinCode(
                confirmCode: controller.bookingParams.bookingCode!,
                pinCode: '2181',
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                controller.bookingParams.hostName!,
                style: TextStyles.s17BoldText,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              IconTitle(
                icon: PhosphorIcons.calendar_check,
                title: controller.bookingParams.displayDate,
              ),
              const SizedBox(
                height: 10,
              ),
              IconTitle(
                icon: PhosphorIcons.map_pin,
                title: controller.bookingParams.province,
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
                'Bạn đã đặt ${controller.bookingParams.bookingDetails.length} phòng',
                style: TextStyles.s17BoldText,
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                itemCount: controller.bookingParams.bookingDetails.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 6,
                  );
                },
                itemBuilder: (context, index) {
                  final BookingDetailDTO bookingDetail =
                      controller.bookingParams.bookingDetails[index];

                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Palette.blue400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bookingDetail.accommodationName!,
                                style: TextStyles.s14BoldText,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              IconTitle(
                                icon: Icons.bed_rounded,
                                child: Text(
                                  BedContentUtil.getLabel(
                                    bookingDetail.bedInfo,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              IconTitle(
                                icon: Icons.confirmation_number_outlined,
                                title: 'Số lượng: ${bookingDetail.quantity}',
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          bookingDetail.priceUnit!.toMoneyFormat,
                          style: TextStyles.s17BoldText
                              .copyWith(color: Palette.red400),
                        )
                      ],
                    ),
                  );
                },
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
                        controller.bookingParams.totalPrice!.toMoneyFormat,
                        style: TextStyles.s17BoldText
                            .copyWith(color: Palette.red400),
                      ),
                      const Text('(Đã bao gồm thuế và phí)')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (controller.bookingParams.canCancel)
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
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
