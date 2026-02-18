import 'package:flutter/material.dart';
import '../../features/auth/view/login_page.dart';
import '../../features/auth/view/register_page.dart';

class AppRoutes {
  static const String login = '/';
  static const String register = '/register';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginPage(),
    register: (context) => RegisterPage(),
  };
}
