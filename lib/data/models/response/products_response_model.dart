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

  factory ProductsResponseModel.fromJson(String str) =>
      ProductsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsResponseModel.fromMap(Map<String, dynamic> json) =>
      ProductsResponseModel(
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
  final int? id;
  final String name;
  final String? description;
  final String price;
  String stock;
  final String image;
  final bool isBestSeller;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          price == other.price &&
          stock == other.stock &&
          image == other.image &&
          isBestSeller == other.isBestSeller &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      stock.hashCode ^
      image.hashCode ^
      isBestSeller.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;

  Product({
    this.id,
    required this.name,
    this.description,
    required this.price,
    required this.stock,
    required this.image,
    this.isBestSeller = false,
    this.createdAt,
    this.updatedAt,
  });

  Product copyWith({
    int? id,
    String? name,
    String? description,
    String? price,
    String? stock,
    String? image,
    bool? isBestSeller,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        stock: stock ?? this.stock,
        image: image ?? this.image,
        isBestSeller: isBestSeller ?? this.isBestSeller,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"] ?? "",
        name: json["name"],
        description: json["description"] ?? "",
        price: json["price"].toString(),
        stock: json["stock"].toString(),
        image: json["image"],
        isBestSeller: json["is_best_seller"] == 1 ? true : false,
        createdAt: DateTime.tryParse(json["created_at"]),
        updatedAt: DateTime.tryParse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description ?? "",
        "price": price,
        "stock": stock,
        "image": image,
        "is_best_seller": isBestSeller ? 1 : 0,
        "created_at": createdAt?.toIso8601String() ?? "",
        "updated_at": updatedAt?.toIso8601String() ?? "",
      };
}
