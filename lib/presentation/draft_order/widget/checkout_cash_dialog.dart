import 'package:flutter/material.dart';
import 'package:pos_bengkel/core/extensions/build_context_ext.dart';
import 'package:pos_bengkel/core/extensions/int_ext.dart';
import 'package:pos_bengkel/core/extensions/string_ext.dart';
import 'package:pos_bengkel/data/datasources/auth_local_datasource.dart';
import 'package:pos_bengkel/data/datasources/product_local_datasource.dart';
import 'package:pos_bengkel/presentation/draft_order/widget/checkout_success_dialog.dart';
import 'package:pos_bengkel/presentation/order/models/order_model.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';
import '../../home/models/order_item.dart';

class CheckoutCashDialog extends StatefulWidget {
  final OrderModel order;

  const CheckoutCashDialog({super.key, required this.order});

  @override
  State<CheckoutCashDialog> createState() => _CheckoutCashDialogState();
}

class _CheckoutCashDialogState extends State<CheckoutCashDialog> {
  TextEditingController? priceController;

  @override
  void initState() {
    priceController = TextEditingController(
        text: (widget.order.totalPrice + widget.order.serviceFee)
            .currencyFormatRp);
    super.initState();
  }

  @override
  void dispose() {
    priceController!.dispose();
    super.dispose();
  }

  void handleProsses({
    required String paymentMethod,
    required int nominal,
    required List<OrderItem> data,
    required int totalQty,
    required int totalPrice,
  }) async {
    try {
      final authData = await AuthLocalDataSource().getAuthData();

      final order = OrderModel(
        paymentMethod: paymentMethod,
        orderName: widget.order.orderName,
        nominal: nominal,
        items: data,
        totalQty: totalQty,
        totalPrice: totalPrice,
        idCashier: authData.user.id,
        cashierName: authData.user.name,
        isSync: false,
        transactionTime: DateTime.now().toString(),
        isCheckout: true,
      );
      ProductLocalDataSource.instance.saveOrder(order);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Stack(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.highlight_off),
            color: AppColors.primary,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                'Pembayaran - Tunai',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceHeight(16.0),
          CustomTextField(
            controller: priceController!,
            label: '',
            showLabel: false,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              final int priceValue = value.toIntegerFromText;
              priceController!.text = priceValue.currencyFormatRp;
              priceController!.selection = TextSelection.fromPosition(
                  TextPosition(offset: priceController!.text.length));
            },
          ),
          const SpaceHeight(16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button.filled(
                onPressed: () {
                  setState(() {
                    priceController!.text =
                        (widget.order.totalPrice + widget.order.serviceFee)
                            .currencyFormatRp;
                  });
                },
                label: 'Uang Pas',
                textColor: AppColors.white,
                fontSize: 12.0,
                width: 112.0,
                height: 50.0,
              ),
              const SpaceWidth(4.0),
              Flexible(
                child: Button.filled(
                  onPressed: () {},
                  label: (widget.order.totalPrice + widget.order.serviceFee)
                      .currencyFormatRp,
                  disabled: true,
                  textColor: AppColors.primary,
                  fontSize: 12.0,
                  height: 50.0,
                ),
              ),
            ],
          ),
          const SpaceHeight(30.0),
          Button.filled(
            onPressed: () {
              handleProsses(
                paymentMethod: widget.order.paymentMethod,
                data: widget.order.items,
                totalPrice: widget.order.totalPrice,
                totalQty: widget.order.totalQty,
                nominal: priceController?.text.toIntegerFromText ?? 0,
              );
              context.pop();
              showDialog(
                context: context,
                builder: (context) => CheckoutSuccessDialog(order: widget.order),
              );
            },
            label: 'Bayar',
          )
        ],
      ),
    );
  }
}
