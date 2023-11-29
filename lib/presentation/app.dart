import 'package:debet_card_transfer/app/app_theme_data.dart';
import 'package:debet_card_transfer/business_logic/cubits/home/home_cubit.dart';
import 'package:debet_card_transfer/business_logic/cubits/login/login_cubit.dart';
import 'package:debet_card_transfer/business_logic/cubits/register/register_cubit.dart';
import 'package:debet_card_transfer/presentation/home/screens/home.dart';
import 'package:debet_card_transfer/presentation/login/screens/login_page.dart';
import 'package:debet_card_transfer/presentation/register/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final String? gsm;
  const MyApp({super.key, required this.isLoggedIn, this.gsm});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Debet Card Transfer',
      theme: AppThemeData.lightTheme,
      routes: {
        '/': (context) => BlocProvider(
              create: (context) => HomeCubit()..getUsers(gsm ?? ''),
              child: const HomeScreen(),
            ),
        '/login': (context) => BlocProvider(
              create: (context) => LoginCubit(),
              child: const LoginPage(),
            ),
        '/register': (context) => BlocProvider(
              create: (context) => RegisterCubit(),
              child: const RegisterPage(),
            ),
      },
      initialRoute: isLoggedIn ? '/' : '/login',
    );
  }
}
