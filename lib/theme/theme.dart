import 'package:flutter/material.dart';

final theme = ThemeData.light().copyWith(
  primaryColor: Colors.red,
  secondaryHeaderColor: Colors.redAccent,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.redAccent,
    textTheme: ButtonTextTheme.primary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.redAccent,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
);