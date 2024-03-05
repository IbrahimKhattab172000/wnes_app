import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF8344AD);
  static const Color secondary = Color(0xFF9D3ADF);
  // static const Color third = Color(0xFF587BBA);
  // static const Color fourth = Color(0xFFBAD2F3);

  static const Color black = Color(0xFF061624);
  static const Color white = Color(0xffFEFCFF);

  static const Color lightGray = Color(0xFFCCCCCC);
  static const Color border = Color(0xFFEFEFEF);

  static const Color gray = Color(0xFF8B97A3);
  static const Color darkGray = Color(0xFF484848);
  static const Color lightPrimary = Color(0xFFE6DAEF);

  static const Color background = Color(0xffFEFEFE);
  static const Color green = Color(0xff3D8551);
  static const Color blue = Color(0xff3B5998);
  static const Color red = Colors.red;

  static const Gradient backgroundGradient = LinearGradient(
    begin: Alignment.topRight,
    colors: [
      AppColors.lightPrimary,
      AppColors.white,
    ],
  );
}

extension AppColorsTheme on Color {
  Color get theme {
    return this;
  }
}
