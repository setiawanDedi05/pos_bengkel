part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.success(List<OrderItem> items,int totalQty, int totalPrice, String paymentMethod, int nominal) = _Success;
  const factory OrderState.error() = _Error;
}
