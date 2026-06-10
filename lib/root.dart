import 'package:flutter/material.dart';
import 'package:nectar/auth/account.dart';
import 'package:nectar/widgets/cart/cart.dart';
import 'package:nectar/screens/favourite.dart';
import 'package:nectar/screens/shop.dart';

class Root extends StatefulWidget {
  const Root({super.key, this.initialPage = 0, this.zone = ''});

  static String currentZone = '';

  final int initialPage;
  final String zone;

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller;
  late List<Widget> screens;
  int currentscreen = 0;
  @override
  void initState() {
    currentscreen = widget.initialPage;
    Root.currentZone = widget.zone;
    screens = [
      Shop(zones: widget.zone),
      const Cart(),
      const Favourite(),
      const Account(),
    ];
    controller = PageController(initialPage: currentscreen);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: screens,
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffFFFFFF),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff53B175),
        unselectedItemColor: Color(0xff181725),
        currentIndex: currentscreen,
        onTap: (index) {
          setState(() {
            currentscreen = index;
          });
          controller.jumpToPage(currentscreen);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Shop"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
