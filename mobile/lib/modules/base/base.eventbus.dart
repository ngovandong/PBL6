import 'package:mobile/common/utils/event_bus/bus_event.model.dart';

class BaseInternalEvent<T> extends InternalBusEvent {
  BaseInternalEvent(String action, T data) : super(action, data);
}
