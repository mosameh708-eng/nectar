import 'package:flutter/material.dart';
import 'package:nectar/auth/account.dart';
import 'package:nectar/widgets/cart/cart.dart';
import 'package:nectar/screens/explore.dart';
import 'package:nectar/screens/favourite.dart';
import 'package:nectar/screens/shop.dart';

class Root extends StatefulWidget {
  const Root({
    super.key,
    required this.image,
    required this.desc,
    required this.name,
    required this.qty,
    required this.price,
  });
  final String image;
  final String desc;
  final String name;
  final int qty;
  final int price;

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller;
  late List<Widget> screens;
  int currentscreen = 0;
  @override
  void initState() {
    screens = [
      Shop(zones: ''),
      Explore(),
      Cart(
        image: widget.image,
        desc: widget.desc,
        name: widget.name,
        qty: widget.qty,
        price: widget.price,
      ),
      Favourite(),
      Account(username: '',email: '',),
    ];
    controller = PageController(initialPage: currentscreen);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: controller, children: screens),

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
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
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
