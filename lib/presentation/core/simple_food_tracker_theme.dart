import 'package:flutter/material.dart';

class SimpleFoodTrackerColor {
  static const Color carbProgressColor = Color(0xffffc714);
  static const Color fatProgressColor = Color(0xff27d2ff);
  static const Color caloriesProgressColor = Color(0xff3fcb7b);
  static const Color proteinProgressColor = Color.fromRGBO(254, 147, 79, 1);
  static const Color backgroundProgressColor = Color(0xffe1e5ec);
  static const Color totalFontColor = Color(0xffa3a7b9);

  static const Color clickAbleColor = Color(0xff7264e3);
  static const Color backgroundColor = Color(0xfff4f6fa);
}

class SimpleFoodTrackerFonts {}

class SimpleFoodTrackerTheme {
  static ThemeData get themeDataLight => ThemeData(
        useMaterial3: true,
      );
}
