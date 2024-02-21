import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_bengkel/core/components/spaces.dart';
import 'package:pos_bengkel/core/extensions/build_context_ext.dart';
import 'package:pos_bengkel/presentation/home/bloc/product/product_bloc.dart';
import 'package:pos_bengkel/presentation/setting/pages/add_product_page.dart';
import '../widget/product_list_item.dart';

class ManageProduct extends StatefulWidget {
  const ManageProduct({super.key});

  @override
  State<ManageProduct> createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kelola Produk"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text("List Product"),
          const SpaceHeight(16),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                success: (products) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ProductItem(
                      data: products[index],
                    ),
                    separatorBuilder: (_, __) => const SpaceHeight(10),
                    itemCount: products.length,
                  );
                },
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(const AddProductPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
