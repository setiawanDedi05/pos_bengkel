import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_bengkel/core/assets/assets.gen.dart';
import 'package:pos_bengkel/core/components/menu_button.dart';
import 'package:pos_bengkel/core/components/spaces.dart';
import 'package:pos_bengkel/core/constants/colors.dart';
import 'package:pos_bengkel/core/extensions/build_context_ext.dart';
import 'package:pos_bengkel/data/datasources/product_local_datasource.dart';
import 'package:pos_bengkel/presentation/home/bloc/product/product_bloc.dart';
import 'package:pos_bengkel/presentation/setting/bloc/sync_order/sync_order_bloc.dart';
import 'package:pos_bengkel/presentation/setting/pages/manage_product_page.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../../auth/pages/login_page.dart';
import '../../home/bloc/logout/logout_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void syncData(dynamic data) async {
    await ProductLocalDataSource.instance.removeAllDataProduct();
    await ProductLocalDataSource.instance
        .insertAllProduct(data.contentResponse.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Setting',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          Row(
            children: [
              MenuButton(
                iconPath: Assets.images.manageProduct.path,
                label: 'Kelola Produk',
                onPressed: () => context.push(const ManageProduct()),
                isImage: true,
                size: 72,
              ),
              const SpaceWidth(16),
              MenuButton(
                iconPath: Assets.images.managePrinter.path,
                label: 'Kelola Printer',
                onPressed: () {},
                isImage: true,
                size: 72,
              )
            ],
          ),
          const SpaceHeight(50),
          BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {
              state.maybeMap(
                  orElse: () {},
                  error: (error) {
                    var message = jsonDecode(error.message);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message["message"]),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  },
                  success: (data) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Sync Data Product Berhasil"),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  });
            },
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return ElevatedButton(
                    onPressed: () {
                      context
                          .read<ProductBloc>()
                          .add(const ProductEvent.fetch());
                    },
                    child: const Text("Sync Data Product"));
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
            },
          ),
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
                return ElevatedButton(
                    onPressed: () {
                      context
                          .read<SyncOrderBloc>()
                          .add(const SyncOrderEvent.syncOrder());
                    },
                    child: const Text("Sync Data Order"));
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
            },
          ),
          BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                error: (e) {
                  var message = jsonDecode(e.message);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message["message"]),
                      backgroundColor: Colors.red,
                    ),
                  );
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                },
                success: (_) {
                  AuthLocalDataSource().removeAuthData();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  context.read<LogoutBloc>().add(const LogoutEvent.logout());
                },
                child: const Row(
                  children: [
                    Text("Logout"),
                    Spacer(),
                    Icon(Icons.logout_sharp),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
