import 'dart:convert';

class ProductsResponseModel {
  final bool success;
  final String message;
  final List<Product> data;

  ProductsResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProductsResponseModel.fromJson(String str) => ProductsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsResponseModel.fromMap(Map<String, dynamic> json) => ProductsResponseModel(
    success: json["success"],
    message: json["message"],
    data: List<Product>.from(json["data"].map((x) => Product.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Product {
  final int id;
  final String name;
  final String description;
  final String price;
  final String stock;
  final String image;
  final bool isBestSeller;
  final bool isSync;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.image,
    this.isBestSeller = false,
    this.isSync = true,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"].toString(),
    stock: json["stock"].toString(),
    image: json["image"],
    isBestSeller: json["is_best_seller"] == 1 ? true : false,
    isSync: json["is_sync"] == null ? true : json["is_sync"] == 1 ? true : false,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "stock": stock,
    "image": image,
    "is_best_seller": isBestSeller ? 1 : 0,
    "is_sync": isSync ? 1 : 0,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
