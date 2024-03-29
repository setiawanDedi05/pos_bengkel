import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_bengkel/core/extensions/build_context_ext.dart';
import 'package:pos_bengkel/core/extensions/date_time_ext.dart';
import 'package:pos_bengkel/core/extensions/int_ext.dart';
import 'package:pos_bengkel/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:pos_bengkel/presentation/order/bloc/order/order_bloc.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/utils/MyPrinter.dart';
import '../../home/pages/dashboard_page.dart';

class PaymentSuccessDialog extends StatefulWidget {
  const PaymentSuccessDialog({super.key});

  @override
  State<PaymentSuccessDialog> createState() => _PaymentSuccessDialogState();
}

class _PaymentSuccessDialogState extends State<PaymentSuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Assets.icons.done.svg()),
            const SpaceHeight(24.0),
            const Text(
              'Pembayaran telah sukses dilakukan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        content: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              success: (items, totalQty, totalPrice, paymentMethod, nominal, serviceFee, orderName) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SpaceHeight(12.0),
                    _LabelValue(
                      label: 'METODE PEMBAYARAN',
                      value: paymentMethod,
                    ),
                    const Divider(height: 36.0),
                    _LabelValue(
                      label: 'TOTAL',
                      value: (totalPrice + serviceFee).currencyFormatRp,
                    ),
                    const Divider(height: 36.0),
                    _LabelValue(
                      label: 'NOMINAL BAYAR',
                      value: nominal.currencyFormatRp,
                    ),
                    const Divider(height: 36.0),
                    _LabelValue(
                      label: 'KEMBALIAN',
                      value: (nominal - totalPrice - serviceFee).currencyFormatRp,
                    ),
                    const Divider(height: 36.0),
                    _LabelValue(
                      label: 'WAKTU PEMBAYARAN',
                      value: DateTime.now().toFormattedTime(),
                    ),
                    const SpaceHeight(40.0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Button.filled(
                            onPressed: () {
                              context.read<CheckoutBloc>().add(const CheckoutEvent.started());
                              context.read<OrderBloc>().add(const OrderEvent.started());
                              context.pushReplacement(const DashboardPage());
                            },
                            label: 'Selesai',
                            fontSize: 13,
                          ),
                        ),
                        const SpaceWidth(10.0),
                        Flexible(
                          child: Button.outlined(
                            onPressed: () async {
                              final ticket = await MyPrint.instance.printOrder(items, totalQty, totalPrice, paymentMethod, nominal, serviceFee);
                              await PrintBluetoothThermal.writeBytes(ticket);
                            },
                            label: 'Print',
                            icon: Assets.icons.print.svg(),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ));
  }
}

class _LabelValue extends StatelessWidget {
  final String label;
  final String value;

  const _LabelValue({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(),
        ),
        const SpaceHeight(5.0),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
