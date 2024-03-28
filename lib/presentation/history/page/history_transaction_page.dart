import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';
import '../../setting/bloc/sync_order/sync_order_bloc.dart';
import '../bloc/history/history_bloc.dart';
import '../widget/history_transaction_item.dart';

class HistoryTransactionPage extends StatefulWidget {
  const HistoryTransactionPage({super.key});

  @override
  State<HistoryTransactionPage> createState() => _HistoryTransactionPageState();
}

class _HistoryTransactionPageState extends State<HistoryTransactionPage> {
  @override
  void initState() {
    // context.read<HistoryBloc>().add(const HistoryEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        centerTitle: true,
        actions: [
          BlocConsumer<SyncOrderBloc, SyncOrderState>(
            listener: (context, state) {
              state.maybeMap(
                  orElse: () {},
                  error: (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(error.message),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  },
                  success: (data) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Sync Data Order Berhasil"),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  });
            },
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return IconButton(
                  onPressed: () {
                    context.read<SyncOrderBloc>().add(
                          const SyncOrderEvent.syncOrder(),
                        );
                  },
                  icon: const Icon(Icons.refresh),
                );
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text("List History"),
          const SpaceHeight(16),
          BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const SizedBox();
                },
                success: (histories) {
                  if (histories.isEmpty) {
                    return const Center(
                      child: Text("No data"),
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => HistoryTransactionItem(
                      data: histories[index],
                    ),
                    separatorBuilder: (_, __) => const SpaceHeight(10),
                    itemCount: histories.length,
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
