import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_bengkel/core/constants/colors.dart';
import 'package:pos_bengkel/data/datasources/product_local_datasource.dart';
import 'package:pos_bengkel/presentation/home/bloc/product/product_bloc.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../../auth/pages/login_page.dart';
import '../../home/bloc/logout/logout_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
          BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {
              state.maybeMap(
                  orElse: () {},
                  success: (_) async {
                    await ProductLocalDataSource.instance
                        .removeAllDataProduct();
                    await ProductLocalDataSource.instance
                        .insertAllProduct(_.contentResponse.toList());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Sync Data Berhasil"),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  });
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<ProductBloc>().add(const ProductEvent.fetch());
                      },
                      child: const Text("Sync Data"));
                },
                loading: (){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              );
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