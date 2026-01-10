import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/screens/product_details.dart';
import 'package:nectar/widgets/cart/add_to.dart';
import 'package:nectar/widgets/custom_text.dart';

class CustomCart extends StatelessWidget {
  const CustomCart({
    super.key,
    required this.image,
    required this.desc,
    required this.name,
    required this.qty,
    required this.price,
    this.bordercolor,
    this.containercolor,
    required this.nutritions,
  });
  final String image, desc, name,nutritions;
  final int qty, price;
  final Color? bordercolor;
  final Color? containercolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => ProductDetails(
              image: image,
              desc: desc,
              name: name,
              qty: qty,
              price: price,
              nutritions: nutritions,
              fav:  false,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(10),
            Expanded(
              child: Image.asset(image, width: 160, fit: BoxFit.contain),
            ),
            Gap(5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: name, color: Colors.black),
                CustomText(text: "${qty.toString()}k", color: Colors.grey),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "\$${price.toString()}",
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 9),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff53B175),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
