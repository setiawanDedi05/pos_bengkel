import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pos_bengkel/core/constants/colors.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/constants/variables.dart';
import '../../../data/models/response/products_response_model.dart';

class ProductItem extends StatelessWidget {
  final Product data;

  const ProductItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary),
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        tilePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(data.name, style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
            Text("Harga : ${data.price}", style: const TextStyle(
              fontSize: 12
            ),),
            Text("Stok : ${data.stock}", style: const TextStyle(
              fontSize: 12
            ),),
          ],
        ),
        leading: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: CachedNetworkImage(
            imageUrl: "${Variables.imageBaseUrl}${data.image}",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              size: 54,
            ),
            width: 80,
          ),
        ),
        children: [
          Button.outlined(
            onPressed: () {},
            label: 'Detail',
            fontSize: 8.0,
            height: 31,
          ),
          const SpaceHeight(16.0),
          Button.outlined(
            onPressed: () {
              // context.push(EditProductPage(data: data));
            },
            label: 'Ubah Produk',
            fontSize: 8.0,
            height: 31,
          ),
        ],
      ),
    );
  }
}
