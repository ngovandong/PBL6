import 'package:mobile/common/utils/event_bus/bus_event.model.dart';

class HotelDetailInternalEvent<T> extends InternalBusEvent {
  HotelDetailInternalEvent(String action, T data) : super(action, data);
}
