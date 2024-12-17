import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CustomerThemeColor extends ThemeColor {
  CustomerThemeColor({
    super.primary = const Color(0xFFD9AF62),
    super.secondary = const Color(0xFFFAF3E6),
    super.appbarForegroundColor = Colors.white,
    super.brightness = Brightness.light,
  });
}

class CustomerDarkThemeColor extends ThemeColor {
  CustomerDarkThemeColor({
    super.primary = const Color.fromARGB(255, 101, 82, 45),
    super.secondary = const Color(0xFFFAF3E6),
    super.appbarForegroundColor = Colors.white,
    super.brightness = Brightness.dark,
  });
}
