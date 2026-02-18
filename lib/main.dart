import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_login/core/routes/app_routes.dart';
import 'features/auth/cubit/auth_cubit.dart';
import 'features/auth/view/login_page.dart';

void main() {
  runApp(
    // 1. Провайдерди эң башына коебуз
    BlocProvider(
      create: (context) => AuthCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doorko App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.login, 
      routes: AppRoutes.routes,// Баштапкы бет
    );
  }
}