import 'package:mobile/common/utils/event_bus/bus_event.model.dart';

class SearchHotelInternalEvent<T> extends InternalBusEvent {
  SearchHotelInternalEvent(String action, T data) : super(action, data);
}
