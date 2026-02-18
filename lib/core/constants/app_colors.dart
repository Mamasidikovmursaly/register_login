import 'package:flutter/material.dart';

class AppColors {
  // 1. Негизги константалар
  static const Color primaryBlue = Color(0xFF4479CE);
  static const Color grayText = Color(0xFF757575);
  static const Color backgroundWhite = Colors.white;
  static const Color darkText = Color(0xFF212121); // Жаңы коштук

  // 2. Бул жерде "null" ордуна түстөрдү көрсөтүңүз
  static Color get border => Colors.grey.shade300; 
  static Color get primary => primaryBlue;
  static Color get textGrey => grayText;
  static Color get textDark => darkText;
}