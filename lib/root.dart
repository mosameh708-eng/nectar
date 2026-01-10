import 'package:flutter/material.dart';
import 'package:nectar/root/account.dart';
import 'package:nectar/root/cart.dart';
import 'package:nectar/root/explore.dart';
import 'package:nectar/root/favourite.dart';
import 'package:nectar/root/shop.dart';


class Root extends StatefulWidget {
  const Root({super.key});



  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late  PageController controller;
   late List <Widget> screens;
   int currentscreen=0;
   @override
  void initState() {
     screens=[
       Shop(),
       Explore(),
       Cart(),
       Favourite(),
       Account(),
     ];
     controller=PageController(initialPage: currentscreen);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: screens,

      ),



      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffFFFFFF),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff53B175),
          unselectedItemColor: Color(0xff181725),
          currentIndex: currentscreen,
          onTap: (index){
          setState(() {
            currentscreen=index;
          });
          controller.jumpToPage(currentscreen);

          },
          items:[
            BottomNavigationBarItem(icon: Icon(Icons.store),label: "Shop"),
            BottomNavigationBarItem(icon: Icon(Icons.explore),label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favourite"),
            BottomNavigationBarItem(icon: Icon(Icons.account_box),label: "Account"),

          ],
      ),
    );
  }
}
