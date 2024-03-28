import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pos_bengkel/core/constants/colors.dart';
import 'package:pos_bengkel/core/extensions/build_context_ext.dart';
import 'package:pos_bengkel/core/extensions/date_time_ext.dart';
import 'package:pos_bengkel/core/extensions/int_ext.dart';
import 'package:pos_bengkel/core/extensions/string_ext.dart';
import 'package:pos_bengkel/presentation/order/models/order_model.dart';

import '../../../core/constants/variables.dart';
import '../pages/detail_draft_order_page.dart';

class DraftOrderItem extends StatefulWidget {
  final OrderModel data;

  const DraftOrderItem({super.key, required this.data});

  @override
  State<DraftOrderItem> createState() => _DraftOrderItemState();
}

class _DraftOrderItemState extends State<DraftOrderItem> {
  @override
  void initState() {
    super.initState();
  }

  void gotoDetails(OrderModel order){
    context.push(DetailDraftOrderPage(order: order));
  }

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
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        tilePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        title: Text(
          "${widget.data.paymentMethod.toUpperCase()} - ${widget.data.orderName}",
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: !widget.data.isSync ? AppColors.primary : AppColors.grey),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(DateTime.parse(widget.data.transactionTime).toFormattedTime(),
                style: const TextStyle(fontSize: 12)),
            Text(
              "${widget.data.totalQty} Items",
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        leading: widget.data.paymentMethod == 'QRIS'
            ? const Icon(Icons.qr_code)
            : const Icon(Icons.money),
        trailing: Text(
          (widget.data.totalPrice + widget.data.serviceFee).currencyFormatRp,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: AppColors.green),
        ),
        children: [
          ListView.separated(
              itemCount: widget.data.items.length + 2,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index < widget.data.items.length) {
                  return ListTile(
                    title: Text(widget.data.items[index].product.name),
                    subtitle:
                        Text("${widget.data.items[index].quantity} items"),
                    trailing: Text(widget.data.items[index].product.price
                        .toIntegerFromText.currencyFormatRp),
                    leading: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${Variables.imageBaseUrl}${widget.data.items[index].product.image}",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          size: 54,
                        ),
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }
                if (index == widget.data.items.length) {
                  return ListTile(
                    title: const Text("Service Fee"),
                    trailing: Text(widget.data.serviceFee.currencyFormatRp),
                  );
                }
                return TextButton(
                  onPressed: () {
                    gotoDetails(widget.data);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primary),
                  ),
                  child: const Text(
                    "Proses",
                    style: TextStyle(color: AppColors.white),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: AppColors.grey,
                );
              })
        ],
      ),
    );
  }
}
