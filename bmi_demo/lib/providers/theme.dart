import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  swithThemeMode(bool val) {
    val == false ? themeMode = ThemeMode.light : themeMode = ThemeMode.dark;
    notifyListeners();
  }
}
