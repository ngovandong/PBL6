import 'package:mobile/common/utils/event_bus/bus_event.model.dart';

class ProfileInternalEvent<T> extends InternalBusEvent {
  ProfileInternalEvent(String action, T data) : super(action, data);
}

abstract class ProfileInternalEventEnum {
  static const String updateSettingProfile = 'UpdateSettingProfile';
}
