import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/utils/event_bus/event_bus.util.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/booking_history/booking_history.enum.dart';
import 'package:mobile/modules/booking_history/booking_history.eventbus.dart';
import 'package:mobile/modules/booking_history/data/repositories/booking_history.repository.dart';
import 'package:mobile/modules/booking_history/data/models/booking.dto.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BookingHistoryController extends GetxController {
  final BookingHistoryRepository bookingHistoryRepository;
  final VerifyAuthController verifyAuthController;

  BookingHistoryController({
    required this.bookingHistoryRepository,
    required this.verifyAuthController,
  });

  List<BookingDTO>? pendingBookings;
  List<BookingDTO>? currentBookings;
  List<BookingDTO>? completedBookings;
  List<BookingDTO>? cancelBookings;

  RefreshController refreshPendingController = RefreshController();
  RefreshController refreshCurrentController = RefreshController();
  RefreshController refreshCompletedController = RefreshController();
  RefreshController refreshCancelController = RefreshController();

  Rx<HandleStatus> getDataStatus = (HandleStatus.NORMAL).obs;
  Rx<HandleStatus> getPendingStatus = (HandleStatus.LOADING).obs;
  Rx<HandleStatus> getCurrentStatus = (HandleStatus.LOADING).obs;
  Rx<HandleStatus> getCompletedStatus = (HandleStatus.LOADING).obs;
  Rx<HandleStatus> getCancelStatus = (HandleStatus.LOADING).obs;

  StreamSubscription? _eventBusSubscription;

  @override
  void onInit() async {
    await _verifyGetData();
    _openEventBus();

    super.onInit();
  }

  @override
  Future<void> onClose() async {
    _cancelEventBus();
    super.onClose();
  }

  Future<void> _verifyGetData() async {
    if (verifyAuthController.currentUser == null) {
      pendingBookings?.clear();
      currentBookings?.clear();
      completedBookings?.clear();
      cancelBookings?.clear();

      getDataStatus.value = HandleStatus.NOT_YET_LOGIN;
    } else {
      getDataStatus.value = HandleStatus.HAS_LOGIN;
      await getPendingBookings();
    }
  }

  void _openEventBus() {
    _eventBusSubscription =
        EventBusUtil.listenEvent<BookingHistoryInternalEvent>((event) async {
      switch (event.action) {
        case BookingHistoryInternalEventEnum.addBookingHistory:
          pendingBookings?.add(event.data);
          update([BookingHistoryType.PENDING.toString()]);
          break;
        case BookingHistoryInternalEventEnum.refreshBookingHistory:
          await _verifyGetData();
          break;
      }
    });
  }

  Future<void> _cancelEventBus() async {
    await _eventBusSubscription?.cancel();
  }

  Future<void> _getData() async {
    try {
      getCurrentStatus.value = HandleStatus.LOADING;

      await getCurrentBookings();
      await getCompletedBookings();
      await getCancelBookings();

      getCurrentStatus.value = HandleStatus.HAS_DATA;
    } catch (err) {
      getCurrentStatus.value = HandleStatus.HAS_ERROR;
      log('Error in _getData from $runtimeType');
    }
  }

  Future<void> getPendingBookings({bool isRefresh = false}) async {
    try {
      getPendingStatus.value = HandleStatus.LOADING;

      pendingBookings = await bookingHistoryRepository
          .getPendingBookings(verifyAuthController.currentUser!.id);

      if (isRefresh) {
        update([BookingHistoryType.PENDING.toString()]);
        refreshPendingController.refreshCompleted();
      }

      getPendingStatus.value = HandleStatus.HAS_DATA;
    } catch (err) {
      if (isRefresh) {
        refreshPendingController.refreshFailed();
      }

      getPendingStatus.value = HandleStatus.HAS_ERROR;
      log('Error in getPendingBookings from $runtimeType');
    }
  }

  Future<void> getCurrentBookings({bool isRefresh = false}) async {
    try {
      getCurrentStatus.value = HandleStatus.LOADING;

      currentBookings = await bookingHistoryRepository
          .getCurrentBookings(verifyAuthController.currentUser!.id);

      if (isRefresh) {
        update([BookingHistoryType.CURRENT.toString()]);
        refreshCurrentController.refreshCompleted();
      }

      getCurrentStatus.value = HandleStatus.HAS_DATA;
    } catch (err) {
      if (isRefresh) {
        refreshCurrentController.refreshFailed();
      }

      getCurrentStatus.value = HandleStatus.HAS_ERROR;
      log('Error in _getCurrentBookings from $runtimeType');
    }
  }

  Future<void> getCompletedBookings({bool isRefresh = false}) async {
    try {
      getCompletedStatus.value = HandleStatus.LOADING;

      completedBookings = await bookingHistoryRepository
          .getCompletedBookings(verifyAuthController.currentUser!.id);

      if (isRefresh) {
        update([BookingHistoryType.COMPLETED.toString()]);
        refreshCompletedController.refreshCompleted();
      }

      getCompletedStatus.value = HandleStatus.HAS_DATA;
    } catch (err) {
      if (isRefresh) {
        refreshCompletedController.refreshFailed();
      }

      getCompletedStatus.value = HandleStatus.HAS_ERROR;
      log('Error in _getCompletedBookings from $runtimeType');
    }
  }

  Future<void> getCancelBookings({bool isRefresh = false}) async {
    try {
      getCancelStatus.value = HandleStatus.LOADING;

      cancelBookings = await bookingHistoryRepository
          .getCancelBookings(verifyAuthController.currentUser!.id);

      if (isRefresh) {
        update([BookingHistoryType.CANCEL.toString()]);
        refreshCancelController.refreshCompleted();
      }

      getCancelStatus.value = HandleStatus.HAS_DATA;
    } catch (err) {
      if (isRefresh) {
        refreshCancelController.refreshFailed();
      }

      getCancelStatus.value = HandleStatus.HAS_ERROR;
      log('Error in _getCompletedBookings from $runtimeType');
    }
  }

  Future<void> onChangedTab(int index) async {
    switch (index) {
      case 0:
        if (pendingBookings == null) {
          await getPendingBookings();
        }
        return;
      case 1:
        if (currentBookings == null) {
          await getCurrentBookings();
        }
        return;
      case 2:
        if (completedBookings == null) {
          await getCompletedBookings();
        }
        return;
      case 3:
        if (cancelBookings == null) {
          await getCancelBookings();
        }
        return;
      default:
    }
  }
}
