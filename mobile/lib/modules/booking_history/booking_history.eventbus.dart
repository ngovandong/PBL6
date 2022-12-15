import 'package:mobile/common/utils/event_bus/bus_event.model.dart';

class BookingHistoryInternalEvent<T> extends InternalBusEvent {
  BookingHistoryInternalEvent(String action, T data) : super(action, data);
}
