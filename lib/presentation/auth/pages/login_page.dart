import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_bengkel/core/constants/colors.dart';
import 'package:pos_bengkel/data/datasources/auth_local_datasource.dart';
import 'package:pos_bengkel/presentation/home/bloc/product/product_bloc.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/spaces.dart';
import '../../../data/datasources/firebase_messaging_datasource.dart';
import '../../home/pages/dashboard_page.dart';
import '../bloc/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void gotoDashboard(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DashboardPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8)
            ),
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Image.asset(
                  Assets.images.logo.path,
                  width: 100,
                  height: 100,
                ),
                const SpaceHeight(8.0),
                const Center(
                  child: Text(
                    "Masuk untuk kasir",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SpaceHeight(40.0),
                CustomTextField(
                  controller: usernameController,
                  label: 'Username',
                ),
                const SpaceHeight(10.0),
                CustomTextField(
                  controller: passwordController,
                  label: 'Password',
                  obscureText: true,
                ),
                const SpaceHeight(24.0),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      success: (authResponseModel) async {
                        context.read<ProductBloc>().add(const ProductEvent.fetch());
                        AuthLocalDataSource().saveAuthData(authResponseModel);
                        await FirebaseMessagingDatasource().initialize();
                        gotoDashboard();
                      },
                      loading: (){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      error: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                    );
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return state.maybeWhen(orElse: () {
                        return Button.filled(
                          borderRadius: 8,
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                  LoginEvent.login(
                                    email: usernameController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          },
                          label: 'Masuk',
                        );
                      }, loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
