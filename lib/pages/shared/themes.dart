import 'package:flutter/material.dart';

import '../../utils/constants.dart';

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
      // brightness: Brightness.light,
      primarySwatch: CompanyColors.teal,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
          // ignore: deprecated_member_use
          primary: Colors.black54,
          elevation: 8,
          shadowColor: Colors.black87,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: kSacondaryColer,
      ),
      //   primaryColor: Color.fromARGB(255, 32, 134, 185),
      // bannerTheme: const MaterialBannerThemeData(
      //     backgroundColor: Color.fromARGB(44, 12, 138, 111)),
      // secondaryHeaderColor: Colors.amber,
      // //canvasColor: Colors.deepPurple,
      // scaffoldBackgroundColor: kBackgroundColor,
      // textTheme: const TextTheme(
      //   displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //   titleLarge: TextStyle(fontSize: 26.0, fontStyle: FontStyle.italic),
      //   bodyMedium: TextStyle(color: Colors.black),
      //   bodySmall: TextStyle(color: Colors.deepPurple),
      //  ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.blueGrey,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
          // ignore: deprecated_member_use
          primary: Colors.black54,
          elevation: 8,
          shadowColor: Colors.black87,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.white,
      ),

      // primarySwatch: Colors.blueGrey,
      //  primaryColor: Colors.white,
      // secondaryHeaderColor: Colors.blueGrey,
      //scaffoldBackgroundColor: Color.fromARGB(255, 53, 56, 57),
      // textTheme: const TextTheme(
      //   bodyMedium: TextStyle(color: Colors.blueGrey, fontSize: 15.0),
      //   displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //   titleLarge: TextStyle(fontSize: 26.0, fontStyle: FontStyle.italic),
      // ),
    );
  }
}

class CompanyColors {
  CompanyColors._(); // this basically makes it so you can instantiate this class

  static const _blackPrimaryValue = 0xFF009688;

  static const MaterialColor teal = const MaterialColor(
    _blackPrimaryValue,
    const <int, Color>{
      50: const Color(0xFFE0F2F1),
      100: const Color(0xFFB2DFDB),
      200: const Color(0xFF80CBC4),
      300: const Color(0xFF4DB6AC),
      400: const Color(0xFF26A69A),
      500: const Color(0xFF009688),
      600: const Color(0xFF00897B),
      700: const Color(0xFF00796B),
      800: const Color(0xFF00695C),
      900: const Color(0xFF004D40),
      901: const Color(0xFF64FFDA),
      902: const Color(0xFF1DE9B6),
    },
  );
}
