import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pos_bengkel/core/extensions/build_context_ext.dart';
import 'package:pos_bengkel/core/extensions/date_time_ext.dart';
import 'package:pos_bengkel/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:pos_bengkel/presentation/order/bloc/order/order_bloc.dart';
import 'package:pos_bengkel/presentation/order/bloc/qris/qris_bloc.dart';
import 'package:pos_bengkel/presentation/order/widgets/payment_success_dialog.dart';

import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../../../data/datasources/product_local_datasource.dart';
import '../../home/models/order_item.dart';
import '../models/order_model.dart';

class PaymentQrisDialog extends StatefulWidget {
  int price;

  PaymentQrisDialog({required this.price, super.key});

  @override
  State<PaymentQrisDialog> createState() => _PaymentQrisDialogState();
}

class _PaymentQrisDialogState extends State<PaymentQrisDialog> {
  String orderId = '';
  Timer? timer;

  @override
  void initState() {
    orderId = DateTime.now().millisecondsSinceEpoch.toString();
    context
        .read<QrisBloc>()
        .add(QrisEvent.generateQrCode(orderId, widget.price));
    super.initState();
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
          transactionTime: DateTime.now().toString(),
      );
      ProductLocalDataSource.instance.saveOrder(order);
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: AppColors.primary,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Pembayaran QRIS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          const SpaceHeight(6.0),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, success: (data, totalQty, totalPrice, paymentMethod, _) {
                return Container(
                  width: context.deviceWidth,
                  padding: const EdgeInsets.all(14.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: AppColors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocListener<QrisBloc, QrisState>(
                        listener: (context, state) {
                          state.maybeWhen(
                              orElse: () {},
                              qrisResponse: (_) {
                                const timerSecond = Duration(seconds: 5);
                                timer = Timer.periodic(
                                  timerSecond,
                                  (timer) {
                                    // context.read<QrisBloc>().add(
                                    //       QrisEvent.checkPaymentStatus(
                                    //         orderId,
                                    //       ),
                                    //     );

                                    //ini di by pass ceritanya bayar
                                    context.read<OrderBloc>().add(OrderEvent.addNominal(totalPrice));
                                    handleProsses(
                                      paymentMethod: paymentMethod,
                                      nominal: totalPrice,
                                      data: data,
                                      totalQty: totalQty,
                                      totalPrice: totalPrice,
                                    );
                                    context.pop();
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                      const PaymentSuccessDialog(),
                                    );
                                  },
                                );
                              },
                              success: (message) {
                                timer?.cancel();

                                //comment untuk bypass
                                // handleProsses(
                                //   paymentMethod: paymentMethod,
                                //   nominal: totalPrice,
                                //   data: data,
                                //   totalQty: totalQty,
                                //   totalPrice: totalPrice,
                                // );
                                // context.pop();
                                // showDialog(
                                //   context: context,
                                //   builder: (context) =>
                                //       const PaymentSuccessDialog(),
                                // );
                              });
                        },
                        child: BlocBuilder<QrisBloc, QrisState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                                orElse: () => const SizedBox(
                                      width: 256.0,
                                      height: 256.0,
                                    ),
                                qrisResponse: (data) {
                                  return SizedBox(
                                    width: 256.0,
                                    height: 256.0,
                                    child:
                                        Image.network(data.actions.first.url),
                                  );
                                },
                                loading: () {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                });
                          },
                        ),
                      ),
                      const SpaceHeight(5.0),
                      const Text(
                        'Scan QRIS untuk melakukan pembayaran',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
