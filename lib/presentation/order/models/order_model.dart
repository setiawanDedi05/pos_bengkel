import '../../home/models/order_item.dart';

class OrderModel {
  final int? id;
  final String? orderName;
  final String paymentMethod;
  final int nominal;
  List<OrderItem> items;
  final int totalQty;
  final int totalPrice;
  final int serviceFee;
  final int idCashier;
  final String cashierName;
  final bool isSync;
  final bool isCheckout;
  final String transactionTime;

  OrderModel({
    this.id,
    this.orderName = 'anonymous',
    required this.paymentMethod,
    required this.nominal,
    required this.items,
    required this.totalQty,
    required this.totalPrice,
    this.serviceFee = 0,
    required this.idCashier,
    required this.cashierName,
    required this.isSync,
    required this.isCheckout,
    required this.transactionTime
  });

  Map<String, dynamic> toMap() => {
        "order_name": orderName,
        "payment_method": paymentMethod,
        "nominal": nominal,
        "items": items.map((e) => e.toMap()).toList(),
        "total_qty": totalQty,
        "total_price": totalPrice,
        "service_fee": serviceFee,
        "id_cashier": idCashier,
        "cashier_name": cashierName,
        "is_sync": isSync,
        "is_checkout": isCheckout
      };

  Map<String, dynamic> toMapSqlite() => {
    "order_name": orderName,
    "payment_method": paymentMethod,
    "nominal": nominal,
    "total_qty": totalQty,
    "total_price": totalPrice,
    "service_fee": serviceFee,
    "id_cashier": idCashier,
    "cashier_name": cashierName,
    "is_sync": isSync ? 1 : 0,
    "is_checkout": isCheckout ? 1 : 0,
    "transaction_time": transactionTime
  };

  factory OrderModel.fromSqlite(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      orderName: map['order_name'],
      serviceFee: map['service_fee'],
      paymentMethod: map['payment_method'] ?? '',
      nominal: map['nominal']?.toInt() ?? 0,
      items: [],
      totalQty: map['total_qty']?.toInt() ?? 0,
      totalPrice: map['total_price']?.toInt() ?? 0,
      idCashier: map['id_cashier']?.toInt() ?? 0,
      isSync: map['is_sync'] == 1 ? true : false,
      isCheckout: map['is_checkout'] == 1 ? true : false,
      cashierName: map['cashier_name'] ?? '',
      transactionTime: map['transaction_time'],
    );
  }
}
