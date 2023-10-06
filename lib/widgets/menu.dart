import 'package:flutter/material.dart';
import 'package:la_comer/theme/colors.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 50),
          ListTile(
            leading: const Icon(
              Icons.person_outline,
              color: secondaryGreen,
              size: 20,
            ),
            title: const Text('Mi perfil'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_cart_outlined,
              color: secondaryGreen,
              size: 20,
            ),
            title: const Text('Mis pedidos'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.location_on_outlined,
              color: secondaryGreen,
              size: 20,
            ),
            title: const Text('Mis direcciones'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
