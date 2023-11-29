import 'package:flutter/material.dart';

class AppThemeData {
  AppThemeData._();

  static ThemeData get lightTheme => ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
            floatingLabelAlignment: FloatingLabelAlignment.center,
            floatingLabelBehavior: FloatingLabelBehavior.always),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      );
}
