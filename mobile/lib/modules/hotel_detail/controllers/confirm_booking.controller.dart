import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobile/common/utils/event_bus/event_bus.util.dart';
import 'package:mobile/common/utils/snackbar.util.dart';
import 'package:mobile/common/utils/url_launcher.util.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/booking_history/booking_history.enum.dart';
import 'package:mobile/modules/booking_history/booking_history.eventbus.dart';
import 'package:mobile/modules/booking_history/data/models/booking.dto.dart';
import 'package:mobile/modules/booking_history/data/repositories/booking_history.repository.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmBookingController extends GetxController {
  final BookingHistoryRepository bookingHistoryRepository;

  ConfirmBookingController({
    required this.bookingHistoryRepository,
  });

  final Rx<BookingDTO> bookingInfo =
      ((Get.arguments as BookingDTO).copyWith()).obs;

  bool isLoadingPayment = false;

  StreamSubscription? _bookingEventBusSubscription;

  @override
  void onInit() {
    _openProfileEventBus();
    super.onInit();
  }

  @override
  Future<void> onClose() async {
    await _closeProfileEventBus();
  }

  Future<void> submitPaymentBooking() async {
    if (isLoadingPayment) {
      return;
    }

    isLoadingPayment = true;

    try {
      final String paymentUrl =
          await bookingHistoryRepository.paymentBooking(bookingInfo.value.id!);

      await UrlLauncherUtil.loadUrl(paymentUrl);
    } catch (err) {
      log('Error in submitPaymentBooking: $err');
      SnackbarUtil.showError();
    } finally {
      isLoadingPayment = false;
    }
  }

  void _openProfileEventBus() {
    _bookingEventBusSubscription =
        EventBusUtil.listenEvent<BookingHistoryInternalEvent>((event) async {
      switch (event.action) {
        case BookingHistoryInternalEventEnum.paymentSuccess:
          isLoadingPayment = false;

          await closeInAppWebView();

          bookingInfo.value.hasPayment = true;
          bookingInfo.value.type = BookingHistoryType.CURRENT;
          bookingInfo.refresh();

          SnackbarUtil.showSuccess(
            message: LocaleKeys.booking_history_payment_success.tr,
          );
          break;
        default:
      }
    });
  }

  Future<void> _closeProfileEventBus() async {
    await _bookingEventBusSubscription?.cancel();
  }
}
