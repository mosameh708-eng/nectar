import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/screens/product_details.dart';
import 'package:nectar/widgets/cart/custom_cart.dart';
import 'package:nectar/widgets/custom_navigate.dart';
import 'package:nectar/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class Beverages extends StatelessWidget {
  const Beverages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomNavigate(),
                  CustomText(
                    text: "Beverages",
                    color: Colors.black,
                    fontsize: 24,
                  ),
                  SvgPicture.asset("assets/svgs/Group 6839.svg"),
                ],
              ),
              Gap(20),
              GridView.builder(
                padding: EdgeInsets.all(12),
                itemCount: 8,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: CustomCart(
                        image: "assets/product/pngfuel 11.png",
                        desc: "coke diet is very useful for fat man and woman ",
                        name: "Coke diet",
                        qty: 1,
                        price: 15,
                        bordercolor: Colors.blueGrey,
                        containercolor: Colors.white, nutritions: '',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
