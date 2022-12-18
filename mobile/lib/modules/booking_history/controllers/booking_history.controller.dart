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

class BookingHistoryController extends GetxController {
  final BookingHistoryRepository bookingHistoryRepository;
  final VerifyAuthController verifyAuthController;

  BookingHistoryController({
    required this.bookingHistoryRepository,
    required this.verifyAuthController,
  });

  RxList<BookingDTO> currentBookings = <BookingDTO>[].obs;
  RxList<BookingDTO> completedBookings = <BookingDTO>[].obs;
  RxList<BookingDTO> cancelBookings = <BookingDTO>[].obs;

  Rx<HandleStatus> getDataStatus = (HandleStatus.LOADING).obs;

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
      getDataStatus.value = HandleStatus.NORMAL;
    } else {
      await _getData();
    }
  }

  void _openEventBus() {
    _eventBusSubscription =
        EventBusUtil.listenEvent<BookingHistoryInternalEvent>((event) async {
      switch (event.action) {
        case BookingHistoryInternalEventEnum.addBookingHistory:
          currentBookings.add(event.data);
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
      getDataStatus.value = HandleStatus.LOADING;

      await _getCurrentBookings();
      await _getCompletedBookings();
      await _getCancelBookings();

      getDataStatus.value = HandleStatus.HAS_DATA;
    } catch (err) {
      getDataStatus.value = HandleStatus.HAS_ERROR;
      log('Error in _getData from $runtimeType');
    }
  }

  Future<void> _getCurrentBookings() async {
    currentBookings.value = await bookingHistoryRepository
        .getCurrentBookings(verifyAuthController.currentUser!.id);
  }

  Future<void> _getCompletedBookings() async {
    completedBookings.value = await bookingHistoryRepository
        .getCompletedBookings(verifyAuthController.currentUser!.id);
  }

  Future<void> _getCancelBookings() async {
    cancelBookings.value = await bookingHistoryRepository
        .getCancelBookings(verifyAuthController.currentUser!.id);
  }
}
