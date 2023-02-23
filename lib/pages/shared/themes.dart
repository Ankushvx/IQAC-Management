import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.black,
      brightness: Brightness.light,
      secondaryHeaderColor: Colors.amberAccent,
      //  canvasColor: Colors.cyan,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
          .copyWith(secondary: Colors.amber),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      primaryColor: Colors.white,
      secondaryHeaderColor: Colors.amberAccent,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.blueGrey,
    );
  }
}
