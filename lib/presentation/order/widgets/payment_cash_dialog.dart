import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pos_bengkel/core/extensions/build_context_ext.dart';
import 'package:pos_bengkel/core/extensions/date_time_ext.dart';
import 'package:pos_bengkel/core/extensions/int_ext.dart';
import 'package:pos_bengkel/core/extensions/string_ext.dart';
import 'package:pos_bengkel/data/datasources/auth_local_datasource.dart';
import 'package:pos_bengkel/data/datasources/product_local_datasource.dart';
import 'package:pos_bengkel/presentation/order/bloc/order/order_bloc.dart';
import 'package:pos_bengkel/presentation/order/models/order_model.dart';
import 'package:pos_bengkel/presentation/order/widgets/payment_success_dialog.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';
import '../../home/models/order_item.dart';

class PaymentCashDialog extends StatefulWidget {
  final int price;

  const PaymentCashDialog({super.key, required this.price});

  @override
  State<PaymentCashDialog> createState() => _PaymentCashDialogState();
}

class _PaymentCashDialogState extends State<PaymentCashDialog> {
  TextEditingController? priceController;

  @override
  void initState() {
    priceController =
        TextEditingController(text: widget.price.currencyFormatRp);
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
          nominal: nominal,
          items: data,
          totalQty: totalQty,
          totalPrice: totalPrice,
          idCashier: authData.user.id,
          cashierName: authData.user.name,
          isSync: false,
          transactionTime: DateTime.now().toString());
      ProductLocalDataSource.instance.saveOrder(order);
    } catch (error) {
      print(error.toString());
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
                    priceController!.text = widget.price.currencyFormatRp;
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
                  label: widget.price.currencyFormatRp,
                  disabled: true,
                  textColor: AppColors.primary,
                  fontSize: 12.0,
                  height: 50.0,
                ),
              ),
            ],
          ),
          const SpaceHeight(30.0),
          BlocConsumer<OrderBloc, OrderState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (data, totalQty, totalPrice, paymentMethod, nominal) {
                  handleProsses(
                      paymentMethod: paymentMethod,
                      data: data,
                      totalPrice: totalPrice,
                      totalQty: totalQty,
                      nominal: nominal,
                  );
                  context.pop();
                  showDialog(
                    context: context,
                    builder: (context) => const PaymentSuccessDialog(),
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => const SizedBox(),
                  success:
                      (data, totalQty, totalPrice, paymentMethod, nominal) {
                    return Button.filled(
                      onPressed: () {
                        context.read<OrderBloc>().add(OrderEvent.addNominal(
                            priceController!.text.toIntegerFromText));
                      },
                      label: 'Proses',
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
