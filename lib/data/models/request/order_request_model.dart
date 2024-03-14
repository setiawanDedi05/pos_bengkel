import 'dart:convert';

import 'package:pos_bengkel/presentation/home/models/order_item.dart';

class OrderRequestModel {
  final String transactionTime;
  final String idCashier;
  final int totalPrice;
  final int totalQty;
  final String paymentMethod;
  final List<OrderItemRequest> orderItems;

  OrderRequestModel({
    required this.transactionTime,
    required this.idCashier,
    required this.totalPrice,
    required this.totalQty,
    required this.paymentMethod,
    required this.orderItems,
  });

  factory OrderRequestModel.fromJson(String str) => OrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderRequestModel.fromMap(Map<String, dynamic> json) => OrderRequestModel(
    transactionTime: json["transaction_time"],
    idCashier: json["id_cashier"],
    totalPrice: json["total_price"],
    totalQty: json["total_qty"],
    paymentMethod: json["payment_method"],
    orderItems: List<OrderItemRequest>.from(json["order_items"].map((x) => OrderItemRequest.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "transaction_time": transactionTime,
    "id_cashier": idCashier,
    "total_price": totalPrice,
    "total_qty": totalQty,
    "payment_method": paymentMethod,
    "order_items": List<dynamic>.from(orderItems.map((x) => x.toMap())),
  };
}

class OrderItemRequest {
  final String idProduct;
  final int quantity;
  final int totalPrice;

  OrderItemRequest({
    required this.idProduct,
    required this.quantity,
    required this.totalPrice,
  });

  factory OrderItemRequest.fromJson(String str) => OrderItemRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItemRequest.fromOrderItemModel(OrderItem orderItem) => OrderItemRequest(
      idProduct: orderItem.product.id.toString(), quantity: orderItem.quantity, totalPrice: orderItem.quantity * int.parse(orderItem.product.price)
  );

  factory OrderItemRequest.fromMap(Map<String, dynamic> json) => OrderItemRequest(
    idProduct: json["id_product"],
    quantity: json["quantity"],
    totalPrice: json["total_price"],
  );

  Map<String, dynamic> toMap() => {
    "id_product": idProduct,
    "quantity": quantity,
    "total_price": totalPrice,
  };
}
