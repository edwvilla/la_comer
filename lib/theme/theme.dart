import 'package:flutter/material.dart';
import 'package:la_comer/theme/colors.dart';

final theme = ThemeData.light().copyWith(
  primaryColor: Colors.red,
  buttonTheme: const ButtonThemeData(
    buttonColor: primaryOrange,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryOrange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: const TextStyle(
        fontSize: 24,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: primaryOrange,
      textStyle: const TextStyle(fontSize: 14, color: primaryOrange),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.redAccent,
  ),
  // TextFormFields
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    filled: true,
    fillColor: formFieldBackgroundColor,
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  ),
);
