import '../../home/models/order_item.dart';

class OrderModel {
  final int? id;
  final String paymentMethod;
  final int nominal;
  List<OrderItem> items;
  final int totalQty;
  final int totalPrice;
  final int idCashier;
  final String cashierName;
  final bool isSync;
  final String transactionTime;

  OrderModel({
    this.id,
    required this.paymentMethod,
    required this.nominal,
    required this.items,
    required this.totalQty,
    required this.totalPrice,
    required this.idCashier,
    required this.cashierName,
    required this.isSync,
    required this.transactionTime
  });

  Map<String, dynamic> toMap() => {
        "payment_method": paymentMethod,
        "nominal": nominal,
        "items": items.map((e) => e.toMap()).toList(),
        "total_qty": totalQty,
        "total_price": totalPrice,
        "id_cashier": idCashier,
        "cashier_name": cashierName,
        "is_sync": isSync,
      };

  Map<String, dynamic> toMapSqlite() => {
    "payment_method": paymentMethod,
    "nominal": nominal,
    "total_qty": totalQty,
    "total_price": totalPrice,
    "id_cashier": idCashier,
    "cashier_name": cashierName,
    "is_sync": isSync ? 1 : 0,
    "transaction_time": transactionTime
  };

  factory OrderModel.fromSqlite(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      paymentMethod: map['payment_method'] ?? '',
      nominal: map['nominal']?.toInt() ?? 0,
      items: [],
      totalQty: map['total_qty']?.toInt() ?? 0,
      totalPrice: map['total_price']?.toInt() ?? 0,
      idCashier: map['id_cashier']?.toInt() ?? 0,
      isSync: map['is_sync'] == 1 ? true : false,
      cashierName: map['cashier_name'] ?? '',
      transactionTime: map['transaction_time'],
    );
  }
}
