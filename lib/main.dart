import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_bengkel/data/datasources/auth_local_datasource.dart';
import 'package:pos_bengkel/data/datasources/firebase_messaging_datasource.dart';
import 'package:pos_bengkel/data/datasources/midtrans_remote_datasource.dart';
import 'package:pos_bengkel/data/datasources/order_remote_datasource.dart';
import 'package:pos_bengkel/data/datasources/product_remote_datasource.dart';
import 'package:pos_bengkel/presentation/auth/pages/login_page.dart';
import 'package:pos_bengkel/presentation/draft_order/bloc/draft_order/draft_order_bloc.dart';
import 'package:pos_bengkel/presentation/history/bloc/history/history_bloc.dart';
import 'package:pos_bengkel/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:pos_bengkel/presentation/home/bloc/logout/logout_bloc.dart';
import 'package:pos_bengkel/presentation/home/bloc/product/product_bloc.dart';
import 'package:pos_bengkel/presentation/home/pages/dashboard_page.dart';
import 'package:pos_bengkel/presentation/order/bloc/order/order_bloc.dart';
import 'package:pos_bengkel/presentation/order/bloc/qris/qris_bloc.dart';
import 'package:pos_bengkel/presentation/setting/bloc/sync_order/sync_order_bloc.dart';
import 'core/constants/colors.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'presentation/auth/bloc/login/login_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessagingDatasource().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ProductBloc(ProductRemoteDataSource())
            ..add(const ProductEvent.fetchLocal()),
        ),
        BlocProvider(create: (context) => CheckoutBloc()),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
        BlocProvider(
          create: (context) => QrisBloc(MidtransRemoteDatasource()),
        ),
        BlocProvider(create: (context) => HistoryBloc()..add(const HistoryEvent.fetch())),
        BlocProvider(create: (context) => DraftOrderBloc()..add(const DraftOrderEvent.fetch())),
        BlocProvider(
          create: (context) => SyncOrderBloc(
            OrderRemoteDatasource(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'PT.Pada Jaya Motor',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.quicksandTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white.withOpacity(0.5),
            elevation: 0,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.primary,
            ),
          ),
        ),
        home: FutureBuilder<bool>(
            future: AuthLocalDataSource().isAuth(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data == true) {
                return const DashboardPage();
              } else {
                return const LoginPage();
              }
            }),
      ),
    );
  }
}
