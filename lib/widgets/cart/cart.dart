import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/product_data/product_model.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_cart_checkout.dart';
import 'package:nectar/widgets/custom_text.dart';
import 'package:nectar/widgets/checkout_sheet.dart'; // Widget بتاع checkout

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const CustomText(
          text: "My Cart",
          color: Colors.black,
          fontsize: 20,
        ),
      ),
      body: Column(
        children: [
          /// Cart Items
          Expanded(
            child: ListView.builder(
              itemCount: ProductModel.products.length,
              itemBuilder: (context, index) {
                final item = ProductModel.products[index];
                return CustomCartCheckout(
                  key: ValueKey(item.name),
                  image: item.image,
                  desc: item.desc,
                  name: item.name,
                  qty: item.qty,
                  price: item.price,
                  onRemove: () {
                    setState(() {
                      ProductModel.products.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),

          /// Checkout Button
          Padding(
            padding: const EdgeInsets.all(12),
            child: CustomButton(
              title: "Go to Checkout",
              color: const Color(0xff53B175),
              fontcolor: Colors.white,
              svgs: false,
              svg: '',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (_) => const CheckoutSheet(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
Widget Checkout(){
  return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Checkout",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),

          const Divider(),

          _item("Delivery", "Select Method"),
          _item("Payment", "", icon: Icons.credit_card),
          _item("Promo Code", "Pick discount"),
          _item("Total Cost", "\$13.97", isBold: true),

          const SizedBox(height: 12),

          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.grey, fontSize: 12),
              children: [
                TextSpan(text: "By placing an order you agree to our "),
                TextSpan(
                  text: "Terms And Conditions",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// Button
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Place Order",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ));
}
