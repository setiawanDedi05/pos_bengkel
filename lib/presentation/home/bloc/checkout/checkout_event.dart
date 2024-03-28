part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started() = _Started;
  const factory CheckoutEvent.addItem(Product product) = _AddItem;
  const factory CheckoutEvent.reduceItem(Product product) = _ReduceItem;
  const factory CheckoutEvent.reduceOrder(Product product) = _ReduceOrder;
}
