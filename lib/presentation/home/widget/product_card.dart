import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_bengkel/core/constants/variables.dart';
import 'package:pos_bengkel/core/extensions/int_ext.dart';
import 'package:pos_bengkel/presentation/home/bloc/checkout/checkout_bloc.dart';
import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';
import '../../../data/models/response/products_response_model.dart';

class ProductCard extends StatelessWidget {
  final Product data;
  final VoidCallback onCartButton;

  const ProductCard({
    super.key,
    required this.data,
    required this.onCartButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: AppColors.card),
              borderRadius: BorderRadius.circular(19),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.disabled.withOpacity(0.4),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  child: CachedNetworkImage(
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    imageUrl: "${Variables.imageBaseUrl}${data.image}",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      size: 54,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                data.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "stock ${data.stock}",
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.grey
                ),
              ),
              const SpaceHeight(8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      int.parse(data.price).currencyFormatRp,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<CheckoutBloc>().add(
                            CheckoutEvent.addItem(
                              data,
                            ),
                          );
                    },
                    child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(9.0)),
                          color: AppColors.primary,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ) //Assets.icons.orders.svg(),
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => const SizedBox(),
                success: (product, qty, price) {
                  return BlocBuilder<CheckoutBloc, CheckoutState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                          orElse: () => const SizedBox(),
                          success: (products, qty, price) {
                            if (qty == 0) {
                              return const SizedBox();
                            }
                            return products
                                    .any((element) => element.product == data)
                                ? products
                                            .firstWhere((element) =>
                                                element.product == data)
                                            .quantity >
                                        0
                                    ? Positioned(
                                        top: 10,
                                        right: 10,
                                        child: CircleAvatar(
                                          backgroundColor: AppColors.primary,
                                          child: Text(
                                            products
                                                .firstWhere((element) =>
                                                    element.product == data)
                                                .quantity
                                                .toString(),
                                            style: const TextStyle(
                                                color: AppColors.white),
                                          ),
                                        ),
                                      )
                                    : const SizedBox()
                                : const SizedBox();
                          });
                    },
                  );
                });
          },
        ),
      ],
    );
  }
}
