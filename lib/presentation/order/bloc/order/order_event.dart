part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.started() = _Started;
  const factory OrderEvent.addPaymentMethod(String paymentMethod, List<OrderItem> items) = _AddPaymentMethod;
  const factory OrderEvent.addNominal(int nominal) = _AddNominal;
  const factory OrderEvent.addServiceFee(int fee) = _AddServiceFee;
  const factory OrderEvent.addOrderName(String name) = _AddOrderName;
}
