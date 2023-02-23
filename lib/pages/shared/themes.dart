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
        primarySwatch: Colors.indigo,
        primaryColor: Colors.amber,
        bannerTheme: MaterialBannerThemeData(
            backgroundColor: Color.fromARGB(44, 12, 138, 111)),
        brightness: Brightness.light,
        //  canvasColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.amberAccent)));
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Colors.cyan,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color.fromARGB(255, 77, 88, 94),
    );
  }
}