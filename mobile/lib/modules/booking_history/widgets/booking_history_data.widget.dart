import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/modules/booking_history/controllers/booking_history.controller.dart';
import 'package:mobile/modules/booking_history/widgets/list_current_booking.widget.dart';

class BookingHistoryData extends GetView<BookingHistoryController> {
  final TabController tabController;

  const BookingHistoryData({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        ListCurrentBooking(
          historyBookings: controller.currentBookings,
        ),
        ListCurrentBooking(
          historyBookings: controller.completedBookings,
        ),
        ListCurrentBooking(
          historyBookings: controller.cancelBookings,
        )
      ],
    );
  }
}
