import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/auth/log_in.dart';
import 'package:nectar/product_data/product_model.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_text.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final username = ProductModel.currentUsername ?? 'Guest';
    final email = ProductModel.currentEmail ?? 'user@example.com';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Color(0xff53B175),
                    child: Icon(Icons.person, color: Colors.white, size: 30),
                  ),
                ),
              ],
            ),
            Gap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: username,
                  color: Colors.black,
                  fontsize: 20,
                  weight: FontWeight.w600,
                ),
                Gap(4),
                CustomText(
                  text: email,
                  color: Color(0xff7C7C7C),
                  fontsize: 16,
                  weight: FontWeight.w400,
                ),
              ],
            ),
            Gap(20),
            buildTile(Icons.shopping_bag_outlined, "Orders"),
            buildTile(Icons.credit_card, "My Details"),
            buildTile(Icons.location_on_outlined, "Delivery Address"),
            buildTile(Icons.account_balance_wallet_outlined, "Payment Methods"),
            buildTile(Icons.discount_outlined, "Promo Code"),
            buildTile(Icons.notifications_none, "Notifications"),
            buildTile(Icons.help_outline, "Help"),
            buildTile(Icons.info_outline, "About"),
            Gap(20),
            Center(
              child: CustomButton(
                title: "Log Out",
                onTap: () {
                  ProductModel.clearUser();
                  ProductModel.clearCart();
                  ProductModel.favorites.clear();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LogIn()),
                  );
                },
                svgs: false,
                color: Color(0xff53B175),
                svg: "assets/svgs/Group 6892.svg",
                fontcolor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
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
