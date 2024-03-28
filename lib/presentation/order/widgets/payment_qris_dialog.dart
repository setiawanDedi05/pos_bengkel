import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_bengkel/core/extensions/build_context_ext.dart';
import 'package:pos_bengkel/presentation/order/bloc/order/order_bloc.dart';
import 'package:pos_bengkel/presentation/order/bloc/qris/qris_bloc.dart';
import 'package:pos_bengkel/presentation/order/widgets/payment_success_dialog.dart';
import 'package:pos_bengkel/presentation/setting/bloc/sync_order/sync_order_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../../../data/datasources/product_local_datasource.dart';
import '../../home/models/order_item.dart';
import '../models/order_model.dart';

class PaymentQrisDialog extends StatefulWidget {
  final int price;
  final String orderName;
  final int fee;

  const PaymentQrisDialog({required this.price, required this.orderName, required this.fee, super.key});

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

  void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }

  void syncAndShowSuccess(int id){
    context.read<SyncOrderBloc>().add(SyncOrderEvent.syncOrderById(id));
    context.pop();
    showDialog(
      context: context,
      builder: (context) => const PaymentSuccessDialog(),
    );
  }

  void handleProsses({
    required String paymentMethod,
    required int nominal,
    required List<OrderItem> data,
    required int totalQty,
    required int totalPrice,
    required int serviceFee
  }) async {
    try {
      final authData = await AuthLocalDataSource().getAuthData();
      final order = OrderModel(
        paymentMethod: paymentMethod,
        nominal: nominal,
        orderName: widget.orderName,
        items: data,
        totalQty: totalQty,
        totalPrice: totalPrice,
        idCashier: authData.user.id,
        cashierName: authData.user.name,
        serviceFee: serviceFee,
        isSync: false,
        isCheckout: true,
        transactionTime: DateTime.now().toString(),
      );
      final int id = await ProductLocalDataSource.instance.saveOrder(order);
      syncAndShowSuccess(id);
    } catch (error) {
      debugPrint(error.toString());
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
              }, success: (data, totalQty, totalPrice, paymentMethod, _, serviceFee, orderName) {
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
                                    context.read<QrisBloc>().add(
                                          QrisEvent.checkPaymentStatus(
                                            orderId,
                                          ),
                                        );
                                  },
                                );
                              },
                              success: (message) {
                                timer?.cancel();
                                handleProsses(
                                  paymentMethod: paymentMethod,
                                  nominal: totalPrice,
                                  data: data,
                                  totalQty: totalQty,
                                  totalPrice: totalPrice,
                                  serviceFee: serviceFee
                                );
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
                                  context
                                      .read<OrderBloc>()
                                      .add(OrderEvent.addNominal(totalPrice));
                                  debugPrint(data.actions[1].url);
                                  return SizedBox(
                                    width: 356.0,
                                    height: 356.0,
                                    child:
                                        Column(
                                          children: [
                                            Image.network(data.actions.first.url),
                                            TextButton(onPressed: () {
                                              launchUrl(data.actions[1].url);
                                            }, child: const Text("Simulasikan pembayaran"),)
                                          ],
                                        ),
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
