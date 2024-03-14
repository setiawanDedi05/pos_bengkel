import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_bengkel/presentation/order/bloc/order/order_bloc.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/menu_button.dart';
import '../../../core/components/spaces.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../widgets/order_card.dart';
import '../widgets/payment_cash_dialog.dart';
import '../widgets/payment_qris_dialog.dart';
import '../widgets/process_button.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final indexValue = ValueNotifier(0);
  var paddingHorizontal = const EdgeInsets.symmetric(horizontal: 16.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Detail'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.delete.svg(),
          ),
        ],
      ),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: Text("No Data"),
              );
            },
            success: (data, qty, total) {
              if (data.isEmpty) {
                return const Center(
                  child: Text("No Data"),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                itemCount: data.length,
                separatorBuilder: (context, index) => const SpaceHeight(20.0),
                itemBuilder: (context, index) => OrderCard(
                  padding: paddingHorizontal,
                  data: data[index],
                  onDeleteTap: () {},
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const SizedBox();
            },
            success: (data, qty, price) {
              return data.isEmpty
                  ? const SizedBox()
                  : Padding(
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
                                    indexValue.value = 1;
                                    context.read<OrderBloc>().add(
                                        OrderEvent.addPaymentMethod(
                                            "cash", data));
                                  },
                                ),
                                const SpaceWidth(10.0),
                                MenuButton(
                                  iconPath: Assets.icons.qrCode.path,
                                  label: 'QRIS',
                                  isActive: value == 2,
                                  onPressed: () {
                                    indexValue.value = 2;
                                    context.read<OrderBloc>().add(
                                          OrderEvent.addPaymentMethod(
                                            "qris",
                                            data,
                                          ),
                                        );
                                  },
                                ),
                                const SpaceWidth(10.0),
                              ],
                            ),
                          ),
                          const SpaceHeight(20.0),
                          BlocBuilder<CheckoutBloc, CheckoutState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return const SizedBox();
                                },
                                success: (data, qty, price) {
                                  return data.isEmpty
                                      ? const SizedBox()
                                      : ProcessButton(
                                          price: price,
                                          onPressed: () async {
                                            if (indexValue.value == 1) {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    PaymentCashDialog(
                                                  price: price,
                                                ),
                                              );
                                            } else if (indexValue.value == 2) {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (context) =>
                                                    PaymentQrisDialog(
                                                  price: price,
                                                ),
                                              );
                                            }
                                          },
                                        );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
            },
          );
        },
      ),
    );
  }
}
