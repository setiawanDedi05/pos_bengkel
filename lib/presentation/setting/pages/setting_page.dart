import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_bengkel/core/extensions/build_context_ext.dart';
import 'package:pos_bengkel/data/datasources/product_local_datasource.dart';
import 'package:pos_bengkel/presentation/setting/pages/manage_printer.dart';
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
        actions: [
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
              return IconButton(
                onPressed: () {
                  context.read<LogoutBloc>().add(const LogoutEvent.logout());
                },
                icon: const Icon(Icons.logout_sharp),
              );
            },
          )
        ],
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          GestureDetector(
            onTap: () => context.push(const ManageProduct()),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2, // Shadow position
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: const ListTile(
                leading: Icon(Icons.settings_rounded),
                trailing: Icon(Icons.chevron_right),
                title: Text("Kelola Produk"),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: () => context.push(const ManagePrinterPage()),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: const ListTile(
                leading: Icon(Icons.settings_rounded),
                trailing: Icon(Icons.chevron_right),
                title: Text("Kelola Printer"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
