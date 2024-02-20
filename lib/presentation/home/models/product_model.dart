import 'package:pos_bengkel/core/extensions/int_ext.dart';

class ProductModel {
  final String image;
  final String name;
  final int price;
  final int stock;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.stock,
  });

  String get priceFormat => price.currencyFormatRp;
}
