abstract class BusEvent<T> {
  T data;

  BusEvent(this.data);
}

abstract class InternalBusEvent<T> extends BusEvent {
  final String action;

  InternalBusEvent(this.action, T data) : super(data);
}
