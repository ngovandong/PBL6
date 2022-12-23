import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/widgets/error_view.widget.dart';
import 'package:mobile/common/widgets/hotel_info_card.widget.dart';
import 'package:mobile/common/widgets/loading_dot.widget.dart';
import 'package:mobile/common/widgets/search_empty.widget.dart';
import 'package:mobile/modules/booking_history/booking_history.enum.dart';
import 'package:mobile/modules/booking_history/controllers/booking_history.controller.dart';
import 'package:mobile/modules/booking_history/data/models/booking.dto.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListBookingHistory extends GetView<BookingHistoryController> {
  final BookingHistoryType bookingHistoryType;

  final HandleStatus handleStatus;

  const ListBookingHistory({
    super.key,
    required this.bookingHistoryType,
    required this.handleStatus,
  });

  List<BookingDTO>? _getList() {
    switch (bookingHistoryType) {
      case BookingHistoryType.PENDING:
        return controller.pendingBookings;
      case BookingHistoryType.CURRENT:
        return controller.currentBookings;
      case BookingHistoryType.COMPLETED:
        return controller.completedBookings;
      case BookingHistoryType.CANCEL:
        return controller.cancelBookings;
    }
  }

  RefreshController _getRefreshController() {
    switch (bookingHistoryType) {
      case BookingHistoryType.PENDING:
        return controller.refreshPendingController;
      case BookingHistoryType.CURRENT:
        return controller.refreshCurrentController;
      case BookingHistoryType.COMPLETED:
        return controller.refreshCompletedController;
      case BookingHistoryType.CANCEL:
        return controller.refreshCancelController;
    }
  }

  Future<void> _refreshData(bool isRefresh) async {
    switch (bookingHistoryType) {
      case BookingHistoryType.PENDING:
        await controller.getPendingBookings(isRefresh: isRefresh);
        break;
      case BookingHistoryType.CURRENT:
        await controller.getCurrentBookings(isRefresh: isRefresh);
        break;
      case BookingHistoryType.COMPLETED:
        await controller.getCompletedBookings(isRefresh: isRefresh);
        break;
      case BookingHistoryType.CANCEL:
        await controller.getCancelBookings(isRefresh: isRefresh);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (handleStatus) {
      case HandleStatus.HAS_DATA:
        return GetBuilder<BookingHistoryController>(
          id: bookingHistoryType.toString(),
          builder: (_) {
            final List<BookingDTO>? data = _getList();

            if (data == null || data.isEmpty) {
              return SearchEmpty(
                width: Get.width * 0.8,
                onPressed: () async {
                  await _refreshData(false);
                },
              );
            }

            return SmartRefresher(
              controller: _getRefreshController(),
              onRefresh: () async {
                await _refreshData(true);
              },
              child: ListView.separated(
                itemCount: data.length,
                padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        RouteManager.detailBookingHistory,
                        arguments: data[index],
                      );
                    },
                    child: HotelInfoCard(bookingParams: data[index]),
                  );
                },
              ),
            );
          },
        );
      case HandleStatus.LOADING:
        return const Center(
          child: LoadingDot(
            dotColor: Palette.blue400,
          ),
        );
      case HandleStatus.HAS_ERROR:
        return const ErrorBanner(
          showAction: false,
        );
      default:
        return const SizedBox();
    }
  }
}
