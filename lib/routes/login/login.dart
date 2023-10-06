import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_comer/routes/home/home.dart';
import 'package:la_comer/theme/colors.dart';
import 'package:la_comer/utils/sizing.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(Sizing.wp(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            SizedBox(height: Sizing.hp(5)),
            SvgPicture.asset(
              'assets/SVG/isotipo login.svg',
              height: Sizing.hp(20),
              fit: BoxFit.contain,
            ),
            SizedBox(height: Sizing.hp(5)),
            SvgPicture.asset(
              'assets/SVG/logotipo.svg',
              height: Sizing.hp(7),
              fit: BoxFit.contain,
            ),
            SizedBox(height: Sizing.hp(5)),
            Form(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Correo electrónico",
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: primaryOrange,
                        size: Sizing.wp(6),
                      ),
                    ),
                  ),
                  SizedBox(height: Sizing.hp(2)),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contraseña",
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: primaryOrange,
                        size: Sizing.wp(6),
                      ),
                    ),
                  ),
                  SizedBox(height: Sizing.hp(8)),
                  SizedBox(
                    width: double.infinity,
                    height: Sizing.hp(6),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HomePage.routeName);
                      },
                      child: const Text('Iniciar Sesión'),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('¿No tienes cuenta?, Registrate'),
            ),
            const Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.1,
                    ),
                  ),
                ),
                Text(
                  'O inicia sesión con',
                  style: TextStyle(
                    color: primaryOrange,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Sizing.hp(3)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/SVG/facebook.svg',
                  height: Sizing.hp(6.5),
                ),
                SizedBox(width: Sizing.wp(6.5)),
                SvgPicture.asset(
                  'assets/SVG/ios.svg',
                  height: Sizing.hp(6.5),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
