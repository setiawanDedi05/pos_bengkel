import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/components/spaces.dart';
import '../bloc/draft_order/draft_order_bloc.dart';
import '../widget/draft_order_item.dart';

class DraftOrderPage extends StatefulWidget {
  const DraftOrderPage({super.key});

  @override
  State<DraftOrderPage> createState() => _DraftOrderPageState();
}

class _DraftOrderPageState extends State<DraftOrderPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Draft Order"),
        centerTitle: true
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text("List Draft Order"),
          const SpaceHeight(16),
          BlocBuilder<DraftOrderBloc, DraftOrderState>(
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
                    itemBuilder: (context, index) => DraftOrderItem(
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