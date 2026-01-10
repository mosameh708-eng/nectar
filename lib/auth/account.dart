import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_text.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             Gap(20),
          //==============  Profile Section  ==============
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  "",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Yousef Sameh",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "yousefyss2@gmail.com",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),

          Gap(30),

          //==============  List Items  =================
          buildTile(Icons.shopping_bag_outlined, "Orders"),
          buildTile(Icons.credit_card, "My Details"),
          buildTile(Icons.location_on_outlined, "Delivery Address"),
          buildTile(Icons.account_balance_wallet_outlined, "Payment Methods"),
          buildTile(Icons.discount_outlined, "Promo Code"),
          buildTile(Icons.notifications_none, "Notifications"),
          buildTile(Icons.help_outline, "Help"),
          buildTile(Icons.info_outline, "About"),

          Gap(20),
                CustomButton(title: "Log Out", onTap: (){}, color: Color(0xffF2F3F2), svgs: true, svg: "assets/svgs/Group 6892.svg", fontcolor: Color(0xff53B175),

                )])));
  }
}
Widget buildTile(IconData icon, String title) {
  return Column(
    children: [
      ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
      const Divider(height: 1),
    ],
  );
}

