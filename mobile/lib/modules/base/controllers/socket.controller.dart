import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:mobile/common/constants/endpoints.dart';
import 'package:mobile/common/utils/event_bus/event_bus.util.dart';
import 'package:mobile/modules/base/base.enum.dart';
import 'package:mobile/modules/base/base.eventbus.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/booking_history/booking_history.enum.dart';
import 'package:mobile/modules/booking_history/booking_history.eventbus.dart';
import 'package:mobile/modules/booking_history/data/models/booking.dto.dart';
import 'package:signalr_netcore/signalr_client.dart';

class SocketController extends GetxController {
  final VerifyAuthController verifyAuthController;

  SocketController({
    required this.verifyAuthController,
  });

  HubConnection? _hubConnection;
  Logger? _logger;
  StreamSubscription<LogRecord>? _logMessagesSub;

  StreamSubscription? _baseEventBusSubcription;

  @override
  void onInit() {
    _openEventBus();
    super.onInit();
  }

  @override
  Future<void> dispose() async {
    await _logMessagesSub?.cancel();
    stopHub();
    _closeEventBus();
    super.dispose();
  }

  void _openEventBus() {
    _baseEventBusSubcription =
        EventBusUtil.listenEvent<BaseInternalEvent>((event) {
      switch (event.action) {
        case BaseInternalEventEnum.connectToSocket:
          if (verifyAuthController.currentUser != null &&
              _hubConnection != null) {
            connectToHub();
          }
          break;
        default:
      }
    });
  }

  void _closeEventBus() {
    _baseEventBusSubcription?.cancel();
  }

  void _setUpLogger() {
    Logger.root.level = Level.INFO; // defaults to Level.INFO
    _logMessagesSub = Logger.root.onRecord.listen((record) {
      log('${record.level.name}: ${record.time}: ${record.message}');
    });
    _logger = Logger('SocketHub');
  }

  void connectToHub() {
    if (verifyAuthController.currentUser == null) {
      return;
    }

    _setUpLogger();

    _hubConnection = HubConnectionBuilder()
        .withUrl(
          '${Endpoints.userHub}?userId=${verifyAuthController.currentUser!.id}',
          options: HttpConnectionOptions(
            skipNegotiation: true,
            transport: HttpTransportType.WebSockets,
          ),
        )
        .configureLogging(_logger!)
        .build();

    _startHub();
  }

  void _listenHubChanges() {
    log('SocketHub: listening hub changes');

    _hubConnection?.onreconnecting(({error}) {
      log('SocketHub reconnecting: $error');
    });

    _hubConnection?.onclose(({error}) {
      log('SocketHub close: $error');
    });
  }

  void _listenEvents() {
    log('SocketHub: listening events');

    _hubConnection?.on('payment-success', (arguments) {
      log('payment-success');

      EventBusUtil.fireEvent(
        BookingHistoryInternalEvent(
          BookingHistoryInternalEventEnum.paymentSuccess,
          PaymentSuccessDTO.fromJson(arguments![0] as Map<String, dynamic>),
        ),
      );
    });
  }

  void _startHub() {
    _hubConnection?.start()?.then((value) {
      log('SocketHub: connect to user hub with id = ${verifyAuthController.currentUser!.id}');

      _listenEvents();
      _listenHubChanges();
    }).catchError((error, stackTrace) {
      log('SocketHub: cannot connect to user hub: $error');
    });
  }

  Future<void> stopHub() async {
    try {
      await _hubConnection?.stop();

      log('SocketHub: stop connect to user hub');
    } catch (err) {
      log('Error in stopHub: $err');
    }
  }
}
