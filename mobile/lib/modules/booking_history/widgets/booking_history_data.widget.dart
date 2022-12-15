import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/modules/booking_history/controllers/booking_history.controller.dart';
import 'package:mobile/modules/booking_history/widgets/list_booking_history.widget.dart';

class BookingHistoryData extends GetView<BookingHistoryController> {
  final TabController tabController;

  const BookingHistoryData({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        Obx(
          () => ListBookingHistory(
            historyBookings: controller.currentBookings.value,
          ),
        ),
        Obx(
          () => ListBookingHistory(
            historyBookings: controller.completedBookings.value,
          ),
        ),
        Obx(
          () => ListBookingHistory(
            historyBookings: controller.cancelBookings.value,
          ),
        )
      ],
    );
  }
}
