import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/root/shop.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_text.dart';

class OrderAccepted extends StatelessWidget {
  const OrderAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Gap(70),
            Image.asset("assets/logo/Group 6872.png", width: 300),
            Gap(20),
            CustomText(
              text: "Your Order has been",
              color: Colors.black,
              fontsize: 28,
            ),
            CustomText(text: "accepted", color: Colors.black, fontsize: 28),
            Gap(10),
            CustomText(
              text: "Your items has been placed and is on",
              color: Color(0xff7C7C7C),
            ),
            CustomText(
              text: "it’s way to being processed",
              color: Color(0xff7C7C7C),
            ),
            Gap(100),
            CustomButton(
              title: "Track Order",
              onTap: () {},
              color: Color(0xff53B175),
              svgs: false,
              svg: '',
              fontcolor: Colors.white,
            ),
            Gap(10),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => Shop()),
              ),
              child: CustomText(text: "Back to home", color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
