import 'package:pos_bengkel/data/models/response/products_response_model.dart';

class OrderItem {
  final Product product;
  int quantity;

  OrderItem({required this.product, required this.quantity});

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      product: Product.fromMap(map['product']),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  factory OrderItem.fromMapSqlite(Map<String, dynamic> map) {
    final Product product = Product(
      id: map["id_product"],
      name: map["name"],
      price: map["price"].toString(),
      stock: map["stock"].toString(),
      image: map["image"],
    );
    return OrderItem(
      product: product,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toMap() =>
      {"product": product.toMap(), "quantity": quantity};

  Map<String, dynamic> toMapSqlite(int orderId) => {
        "id_order": orderId,
        "id_product": product.id,
        "quantity": quantity,
        "price": product.price
      };
}
