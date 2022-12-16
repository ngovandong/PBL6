import 'package:mobile/common/utils/event_bus/bus_event.model.dart';

class FavoriteHostInternalEvent<T> extends InternalBusEvent {
  FavoriteHostInternalEvent(String action, T data) : super(action, data);
}
