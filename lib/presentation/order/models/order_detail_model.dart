import 'package:pos_bengkel/presentation/home/models/order_item.dart';
import 'package:pos_bengkel/presentation/order/models/order_model.dart';

class OrderDetailModel {
  final OrderModel order;
  final OrderItem orderItem;

  OrderDetailModel({required this.order, required this.orderItem});
}
