import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_login/core/routes/app_routes.dart';
import 'package:register_login/features/auth/cubit/auth_bloc.dart';


void main() {
  runApp(
    BlocProvider(
      create: (context) => AuthBloc(),
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
      routes: AppRoutes.routes,
    );
  }
}