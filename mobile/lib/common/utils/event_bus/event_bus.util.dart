import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:mobile/common/utils/event_bus/bus_event.model.dart';

abstract class EventBusUtil {
  static final EventBus _eventBus = EventBus();

  static void fireEvent(BusEvent event) {
    _eventBus.fire(event);
  }

  static StreamSubscription listenEvent<T>(
    void Function(T event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return _eventBus.on<T>().listen(
          onData,
          onError: onError,
          onDone: onDone,
          cancelOnError: cancelOnError,
        );
  }
}
