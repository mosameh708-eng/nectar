import 'package:flutter/material.dart';
import 'package:nectar/product_data/product_model.dart';
import 'package:nectar/root.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_cart_checkout.dart';
import 'package:nectar/widgets/custom_text.dart';

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
            child: ProductModel.cart.isEmpty
                ? const Center(
                    child: CustomText(
                      text: "Your cart is empty",
                      color: Colors.black,
                      fontsize: 18,
                    ),
                  )
                : ListView.builder(
                    itemCount: ProductModel.cart.length,
                    itemBuilder: (context, index) {
                      final item = ProductModel.cart[index];
                      return CustomCartCheckout(
                        key: ValueKey(item.name),
                        image: item.image,
                        desc: item.desc,
                        name: item.name,
                        qty: item.qty,
                        price: item.price,
                        onRemove: () {
                          setState(() {
                            ProductModel.cart.removeAt(index);
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
              onTap: ProductModel.cart.isEmpty
                  ? null
                  : () {
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

class CheckoutSheet extends StatelessWidget {
  const CheckoutSheet({super.key});

  Widget _item(
    String title,
    String subtitle, {
    IconData? icon,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.grey),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
              ),
            ],
          ),
          const Divider(),
          _item("Delivery", "Select Method"),
          _item("Payment", "", icon: Icons.credit_card),
          _item("Promo Code", "Pick discount"),
          _item("Total Cost", "\$${ProductModel.cartTotal}", isBold: true),
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
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (ctx) => Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 60,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Order Placed Successfully!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Total: \$${ProductModel.cartTotal}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () {
                              ProductModel.clearCart();
                              Navigator.of(ctx).pop();
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Root(initialPage: 0, zone: ''),
                                ),
                              );
                            },
                            child: const Text(
                              "Back to Shop",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Text("Place Order", style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
