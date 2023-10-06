import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:la_comer/theme/colors.dart';
import 'package:la_comer/utils/sizing.dart';
import 'package:la_comer/widgets/menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Menu(),
      bottomNavigationBar: const _BottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizing.hp(5),
            horizontal: Sizing.wp(7),
          ),
          child: Column(
            children: [
              const SizedBox(width: double.infinity),
              const _TopRow(),
              SizedBox(height: Sizing.hp(2)),
              const _SearchBar(),
              SizedBox(height: Sizing.hp(5)),
              const _Banner(),
              SizedBox(height: Sizing.hp(1)),
              const _TabBarSelector(),
              const _ItemsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/SVG/home.svg',
                width: 15,
                height: 15,
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/SVG/Ofertas.svg',
                width: 15,
                height: 15,
              ),
              label: 'Descuentos',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/SVG/icono carrito.svg',
                width: 15,
                height: 15,
              ),
              label: 'Carrito',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/SVG/corazon.svg',
                width: 15,
                height: 15,
              ),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/SVG/usuario.svg',
                width: 15,
                height: 15,
              ),
              label: 'Mi Cuenta',
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemsGrid extends StatelessWidget {
  const _ItemsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: Sizing.wp(7),
      mainAxisSpacing: Sizing.hp(2),
      childAspectRatio: 1.2,
      children: const [
        _GridItem(
          label: 'Limón sin semilla',
          price: 25.90,
          image: 'assets/PNG/banner.png',
        ),
        _GridItem(
          label: 'Platano',
          price: 25.90,
          image: 'assets/PNG/banner.png',
        ),
        _GridItem(
          label: 'Granada roja',
          price: 25.90,
          image: 'assets/PNG/banner.png',
        ),
        _GridItem(
          label: 'Naranja',
          price: 25.90,
          image: 'assets/PNG/banner.png',
        ),
      ],
    );
  }
}

class _GridItem extends StatefulWidget {
  const _GridItem(
      {super.key,
      required this.label,
      required this.image,
      required this.price});

  final String label;
  final String image;
  final double price;

  @override
  State<_GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<_GridItem> {
  bool _isFavorite = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity),
                Center(
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.contain,
                    height: Sizing.hp(9),
                    width: Sizing.wp(15),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: Sizing.wp(15),
                        child: Text(
                          widget.label,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$${widget.price}',
                        style: const TextStyle(
                          color: secondaryGreen,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '1kg',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // Add to cart button
                      const Spacer(),
                      if (count == 0)
                        InkWell(
                          onTap: () {
                            setState(() {
                              count++;
                            });
                          },
                          child: SvgPicture.asset('assets/SVG/icono mas.svg',
                              height: 20),
                        )
                      else
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                              color: secondaryGreen,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    count--;
                                  });
                                },
                                child: SvgPicture.asset(
                                    'assets/SVG/icono menos.svg',
                                    height: 15),
                              ),
                              Text(
                                '${count}kg',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: SvgPicture.asset(
                                    'assets/SVG/icono mas.svg',
                                    height: 15),
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  icon: _isFavorite
                      ? SvgPicture.asset('assets/SVG/icono wishlist activo.svg')
                      : SvgPicture.asset('assets/SVG/icono wishlist.svg')),
            ),
          ],
        ));
  }
}

class _TabBarSelector extends StatelessWidget {
  const _TabBarSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: primaryGray,
              width: 1,
            ),
          ),
        ),
        child: const TabBar(
          indicatorColor: secondaryGreen,
          dividerColor: Colors.red,
          automaticIndicatorColorAdjustment: false,
          labelColor: secondaryGreen,
          labelStyle: TextStyle(fontSize: 13),
          tabs: [
            Tab(text: 'Todo'),
            Tab(text: 'Frutas y verduras'),
            Tab(text: 'Carnes'),
            Tab(text: 'Abarrotes'),
          ],
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    super.key,
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: secondaryGreen,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 3,
          color: selected ? primaryGray : secondaryGreen,
        ),
      ],
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizing.wp(100),
      height: Sizing.hp(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizing.wp(7),
              vertical: Sizing.hp(2.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: Sizing.wp(50),
                  child: const Text(
                    'Hasta 35% off en frutas y verduras seleccionadas',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Chip(
                  visualDensity: VisualDensity.compact,
                  labelPadding: EdgeInsets.zero,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  label: Text(
                    'Ver oferta',
                    style: TextStyle(
                      color: secondaryGreen,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/PNG/banner.png',
              height: Sizing.hp(13),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizing.wp(100),
      height: Sizing.hp(6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Buscar productos...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: primaryOrange,
                    size: Sizing.wp(8),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: Sizing.hp(6.5),
            padding: EdgeInsets.all(Sizing.hp(1)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: formFieldBackgroundColor,
              border: Border.all(
                color: primaryOrange,
                width: 1.2,
              ),
            ),
            child: SvgPicture.asset(
              'assets/SVG/icono filtro.svg',
            ),
          ),
        ],
      ),
    );
  }
}

class _TopRow extends StatelessWidget {
  const _TopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            Chip(
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.zero,
              label: Row(
                children: [
                  const Text(
                    'Cambiar sucursal',
                    style: TextStyle(
                      color: secondaryGreen,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    'assets/SVG/Icono cambiar de sucursal.svg',
                    height: 8,
                  )
                ],
              ),
              shape: const StadiumBorder(
                side: BorderSide(
                  color: secondaryGreen,
                  width: 1,
                ),
              ),
              visualDensity: VisualDensity.compact,
            ),
            const Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: secondaryGreen,
                  size: 20,
                ),
                SizedBox(width: 5),
                Text(
                  'Sucursal Norte',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),

        // Menu icon
        const Spacer(),
        Builder(
          builder: (context) {
            return InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: SvgPicture.asset(
                'assets/SVG/Icono de menú.svg',
                height: Sizing.hp(6),
              ),
            );
          },
        ),
      ],
    );
  }
}
