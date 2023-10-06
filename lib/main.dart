import 'package:flutter/material.dart';
import 'package:la_comer/routes/login/login.dart';
import 'package:la_comer/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: LoginPage.routeName,
      routes: routes,
    );
  }
}