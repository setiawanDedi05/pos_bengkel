import 'package:image_picker/image_picker.dart';

class AddProductsRequestModel {
  final String name;
  final int price;
  final int stock;
  final int isBestSeller;
  final XFile image;

  AddProductsRequestModel({
    required this.name,
    required this.price,
    required this.stock,
    required this.isBestSeller,
    required this.image,
  });

  Map<String, String> toMap() => {
    "name": name,
    "price": price.toString(),
    "stock": stock.toString(),
    "is_best_seller": isBestSeller.toString(),
  };
}
