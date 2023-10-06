import 'package:flutter/material.dart';
import 'package:la_comer/routes/login/login.dart';
import 'package:la_comer/routes/routes.dart';
import 'package:la_comer/theme/theme.dart';
import 'package:la_comer/utils/sizing.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Comer Test',
      initialRoute: LoginPage.routeName,
      routes: routes,
      theme: theme,
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        Sizing(context);
        return MediaQuery(
          data: mediaQueryData.copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}
