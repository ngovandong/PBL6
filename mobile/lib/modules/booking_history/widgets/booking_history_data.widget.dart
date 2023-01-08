import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/modules/booking_history/booking_history.enum.dart';
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
            bookingHistoryType: BookingHistoryType.PENDING,
            handleStatus: controller.getPendingStatus.value,
          ),
        ),
        Obx(
          () => ListBookingHistory(
            bookingHistoryType: BookingHistoryType.CURRENT,
            handleStatus: controller.getCurrentStatus.value,
          ),
        ),
        Obx(
          () => ListBookingHistory(
            bookingHistoryType: BookingHistoryType.COMPLETED,
            handleStatus: controller.getCompletedStatus.value,
          ),
        ),
        Obx(
          () => ListBookingHistory(
            bookingHistoryType: BookingHistoryType.CANCEL,
            handleStatus: controller.getCancelStatus.value,
          ),
        )
      ],
    );
  }
}
