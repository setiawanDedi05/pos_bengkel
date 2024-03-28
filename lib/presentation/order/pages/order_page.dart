import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_bengkel/core/constants/colors.dart';
import 'package:pos_bengkel/core/extensions/string_ext.dart';
import 'package:pos_bengkel/presentation/draft_order/bloc/draft_order/draft_order_bloc.dart';
import 'package:pos_bengkel/presentation/order/bloc/order/order_bloc.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/menu_button.dart';
import '../../../core/components/spaces.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../../../data/datasources/product_local_datasource.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../../home/models/order_item.dart';
import '../models/order_model.dart';
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
  late TextEditingController orderName;
  late TextEditingController serviceFee;
  late FocusNode focusNode;
  int fee = 0;

  @override
  void initState() {
    orderName = TextEditingController(text: "anonymous");
    serviceFee = TextEditingController(text: "0");
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    orderName.dispose();
    serviceFee.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void clearDataAndFetch(){
    context.read<CheckoutBloc>().add(const CheckoutEvent.started());
    context.read<OrderBloc>().add(const OrderEvent.started());
    context.read<DraftOrderBloc>().add(const DraftOrderEvent.fetch());
  }

  void showSnackBarSuccess(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void showSnackBarError(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void handleSave({
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
          orderName: orderName.text,
          nominal: nominal,
          items: data,
          totalQty: totalQty,
          totalPrice: totalPrice,
          idCashier: authData.user.id,
          cashierName: authData.user.name,
          isSync: false,
          transactionTime: DateTime.now().toString(),
          isCheckout: false,
          serviceFee: serviceFee.text.toIntegerFromText);
      await ProductLocalDataSource.instance.saveOrder(order);
      clearDataAndFetch();
      showSnackBarSuccess("Order telah tersimpan");
    } catch (error) {
      showSnackBarError(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Detail'),
        centerTitle: true,
        actions: [
          BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
            return state.maybeWhen(orElse: () {
              return const SizedBox();
            }, success: (data, qty, price) {
              return data.isEmpty
                  ? const SizedBox()
                  : IconButton(
                      onPressed: () {
                        context
                            .read<CheckoutBloc>()
                            .add(const CheckoutEvent.started());
                      },
                      icon: Assets.icons.delete.svg());
            });
          })
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
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                itemCount: data.length + 2,
                separatorBuilder: (context, index) => const SpaceHeight(10.0),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextField(
                        controller: orderName,
                        label: 'Nama Order'
                      ),
                    );
                  }
                  if (index == 1) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextField(
                        controller: serviceFee,
                        inputFormatter: [CurrencyTextInputFormatter(locale: 'id', decimalDigits: 0, symbol: '')],
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
                    data: data[index - 2],
                    onDeleteTap: () {
                      context.read<CheckoutBloc>().add(
                          CheckoutEvent.reduceOrder(data[index - 2].product));
                    },
                  );
                },
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
                                    setState(() {
                                      indexValue.value = 1;
                                    });
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
                                    setState(() {
                                      indexValue.value = 2;
                                    });
                                    context.read<OrderBloc>().add(
                                          OrderEvent.addPaymentMethod(
                                            "qris",
                                            data,
                                          ),
                                        );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SpaceHeight(10.0),
                          BlocBuilder<CheckoutBloc, CheckoutState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return const SizedBox();
                                },
                                success: (data, qty, price) {
                                  return data.isEmpty || indexValue.value == 0
                                      ? const SizedBox()
                                      : ProcessButton(
                                          price: price + fee,
                                          title: "Simpan Dulu",
                                          isPrimary: false,
                                          onPressed: () {
                                            handleSave(
                                              paymentMethod:
                                                  indexValue.value > 1
                                                      ? 'qris'
                                                      : 'cash',
                                              nominal: 0,
                                              data: data,
                                              totalQty: qty,
                                              totalPrice: price,
                                            );
                                          },
                                        );
                                },
                              );
                            },
                          ),
                          const SpaceHeight(10.0),
                          BlocBuilder<CheckoutBloc, CheckoutState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return const SizedBox();
                                },
                                success: (data, qty, price) {
                                  return data.isEmpty || indexValue.value == 0
                                      ? const SizedBox()
                                      : ProcessButton(
                                          price: price + fee,
                                          onPressed: () {
                                            context.read<OrderBloc>().add(OrderEvent.addServiceFee(fee));
                                            context.read<OrderBloc>().add(OrderEvent.addOrderName(orderName.text));
                                            if (indexValue.value == 1) {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    PaymentCashDialog(
                                                  price: price,
                                                  fee: fee,
                                                  orderName: orderName.text,
                                                ),
                                              );
                                            } else if (indexValue.value == 2) {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (context) =>
                                                    PaymentQrisDialog(
                                                  price: price,
                                                  fee: fee,
                                                  orderName: orderName.text,
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
