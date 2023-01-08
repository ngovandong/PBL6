import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/utils/bed_content.util.dart';
import 'package:mobile/common/widgets/icon_title.widget.dart';
import 'package:mobile/modules/booking_history/controllers/booking_history_detail.controller.dart';
import 'package:mobile/modules/booking_history/data/models/booking.dto.dart';

class ListBookingHistoryRoom extends GetView<BookingHistoryDetailController> {
  const ListBookingHistoryRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.bookingParams.value.bookingDetails.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 6,
        );
      },
      itemBuilder: (context, index) {
        final BookingDetailDTO bookingDetail =
            controller.bookingParams.value.bookingDetails[index];

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
                style: TextStyles.s17BoldText.copyWith(color: Palette.red400),
              )
            ],
          ),
        );
      },
    );
  }
}
