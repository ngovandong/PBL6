import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/widgets/hotel_info_card.widget.dart';
import 'package:mobile/modules/hotel_detail/data/models/dtos/booking.dto.dart';

class ListCurrentBooking extends StatelessWidget {
  final List<BookingDTO> historyBookings;

  const ListCurrentBooking({
    super.key,
    required this.historyBookings,
  });

  @override
  Widget build(BuildContext context) {
    if (historyBookings.isEmpty) {
      return const Center(
        child: Text('Danh sách trống'),
      );
    } else {
      return ListView.separated(
        itemCount: historyBookings.length,
        padding: const EdgeInsets.only(
          top: UIConfigs.horizontalPadding,
        ),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(RouteManager.detailBookingHistory);
            },
            child: HotelInfoCard(bookingParams: historyBookings[index]),
          );
        },
      );
    }
  }
}
