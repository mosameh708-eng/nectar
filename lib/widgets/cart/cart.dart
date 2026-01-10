import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_cart_checkout.dart';
import 'package:nectar/widgets/custom_text.dart';

class Cart extends StatelessWidget {
  const Cart({
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(text: "My Cart", color: Colors.black, fontsize: 20),
      ),
      body: Column(
        children: [
          Column(
            children: List.generate(3, (index) {
              return CustomCartCheckout(
                image: image,
                desc: desc,
                name: name,
                qty: qty,
                price: price,
              );
            }),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomButton(
              title: "Go to Checkout",
              onTap: () {},
              color: Color(0xff53B175),
              fontcolor: Colors.white,
              svgs: false,
              svg: '',
            ),
          ),
        ],
      ),
    );
  }
}
