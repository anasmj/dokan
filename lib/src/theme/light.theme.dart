import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.black,
  buttonTheme: const ButtonThemeData(buttonColor: Colors.orange),
  inputDecorationTheme: const InputDecorationTheme(
    isDense: true,
    contentPadding: EdgeInsets.all(8),
    border: InputBorder.none,
    filled: true,
    fillColor: Colors.white,
  ),
);
