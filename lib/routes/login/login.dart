import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(

        child: Column(
          children: [
              Image.asset('assets/PNG/isotipo.png'),
          ],
        )
      ),

    );
  }
}