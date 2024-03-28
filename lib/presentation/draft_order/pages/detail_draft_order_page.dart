import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_bengkel/core/constants/colors.dart';
import 'package:pos_bengkel/core/extensions/int_ext.dart';
import 'package:pos_bengkel/core/extensions/string_ext.dart';
import 'package:pos_bengkel/presentation/draft_order/bloc/draft_order/draft_order_bloc.dart';
import 'package:pos_bengkel/presentation/order/bloc/order/order_bloc.dart';
import 'package:pos_bengkel/presentation/order/models/order_model.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/menu_button.dart';
import '../../../core/components/spaces.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../../order/widgets/order_card.dart';
import '../../order/widgets/process_button.dart';
import '../widget/checkout_cash_dialog.dart';
import '../widget/checkout_qris_dialog.dart';

class DetailDraftOrderPage extends StatefulWidget {
  final OrderModel order;

  const DetailDraftOrderPage({required this.order, super.key});

  @override
  State<DetailDraftOrderPage> createState() => _DetailDraftOrderPageState();
}

class _DetailDraftOrderPageState extends State<DetailDraftOrderPage> {
  final indexValue = ValueNotifier(0);
  var paddingHorizontal = const EdgeInsets.symmetric(horizontal: 16.0);
  late TextEditingController orderName;
  late TextEditingController serviceFee;
  int fee = 0;

  @override
  void initState() {
      orderName = TextEditingController(text: widget.order.orderName);
      serviceFee = TextEditingController(text: widget.order.serviceFee.currencyFormat);
    setState(() {
      fee = widget.order.serviceFee;
      indexValue.value = widget.order.paymentMethod == 'qris' ? 2 : 1;
    });
    super.initState();
  }

  @override
  void dispose() {
    orderName.dispose();
    serviceFee.dispose();
    super.dispose();
  }

  void clearDataAndFetch() {
    context.read<CheckoutBloc>().add(const CheckoutEvent.started());
    context.read<OrderBloc>().add(const OrderEvent.started());
    context.read<DraftOrderBloc>().add(const DraftOrderEvent.fetch());
  }

  void showSnackBarSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void showSnackBarError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draft Order Detail'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: widget.order.items.length + 2,
        separatorBuilder: (context, index) => const SpaceHeight(10.0),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                controller: orderName,
                label: 'Nama Order',
              ),
            );
          }
          if (index == 1) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                controller: serviceFee,
                inputFormatter: [
                  CurrencyTextInputFormatter(
                      locale: 'id', decimalDigits: 0, symbol: '')
                ],
                label: 'Biaya Service',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    fee = value.toIntegerFromText;
                  });
                },
              ),
            );
          }
          return OrderCard(
            padding: paddingHorizontal,
            data: widget.order.items[index - 2],
            onDeleteTap: () {
              context.read<CheckoutBloc>().add(CheckoutEvent.reduceOrder(
                  widget.order.items[index - 2].product));
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder(
              valueListenable: indexValue,
              builder: (context, value, _) => Row(
                children: [
                  const SpaceWidth(10.0),
                  MenuButton(
                    iconPath: Assets.icons.cash.path,
                    label: 'Tunai',
                    isActive: value == 1,
                    onPressed: () {
                      setState(() {
                        indexValue.value = 1;
                      });
                      context.read<OrderBloc>().add(
                            OrderEvent.addPaymentMethod(
                              "cash",
                              widget.order.items,
                            ),
                          );
                    },
                  ),
                  const SpaceWidth(10.0),
                  MenuButton(
                    iconPath: Assets.icons.qrCode.path,
                    label: 'QRIS',
                    isActive: value == 2,
                    onPressed: () {
                      setState(() {
                        indexValue.value = 2;
                      });
                      context.read<OrderBloc>().add(
                            OrderEvent.addPaymentMethod(
                              "qris",
                              widget.order.items,
                            ),
                          );
                    },
                  ),
                ],
              ),
            ),
            const SpaceHeight(10.0),
            ProcessButton(
              price: widget.order.totalPrice + fee,
              onPressed: () {
                if (indexValue.value == 1) {
                  showDialog(
                    context: context,
                    builder: (context) => CheckoutCashDialog(
                      order: widget.order,
                    ),
                  );
                } else if (indexValue.value == 2) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => CheckoutQrisDialog(
                      order: widget.order,
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
