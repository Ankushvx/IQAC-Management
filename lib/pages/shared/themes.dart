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
      primaryColor: Colors.white,
      bannerTheme: const MaterialBannerThemeData(
          backgroundColor: Color.fromARGB(44, 12, 138, 111)),
      brightness: Brightness.light,
      secondaryHeaderColor: Colors.indigo,
      //canvasColor: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 26.0, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(color: Colors.black),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      primaryColor: Colors.white,
      secondaryHeaderColor: Colors.blueGrey,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color.fromARGB(255, 53, 56, 57),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.indigoAccent, fontSize: 15.0),
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 26.0, fontStyle: FontStyle.italic),
      ),
    );
  }
}
