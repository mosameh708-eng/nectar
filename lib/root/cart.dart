import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_text.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});




  @override
  State<Cart> createState() => _CartState();
}




class _CartState extends State<Cart> {






  List<int> qty = List.filled(5, 1); //

  void increment(int index) {
    setState(() {
      qty[index]++;
    });
  }

  void decrement(int index) {
    setState(() {
      if (qty[index] > 1) qty[index]--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Gap(20),
              CustomText(text: "My Cart", color: Colors.black, fontsize: 24),
              Gap(20),
              Divider(),
        
            
              ...List.generate(5, (index) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                        "", width: 120),
        
                        Gap(20),
        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // الاسم + delete icon
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      text: "",
                                      color: Colors.black,
                                    ),
                                  ),
                                  SvgPicture.asset("assets/svgs/Group 6862.svg"),
                                ],
                              ),
        
                              Gap(10),
        
                              CustomText(
                                text: "${qty[index]}k",
                                color: Colors.black,
                                fontsize: 14,
                              ),
        
                              Gap(15),
        
                              Row(
                                children: [
                                  // زر -
                                  GestureDetector(
                                    onTap: () => decrement(index),
                                    child: SvgPicture.asset(
                                      "assets/svgs/minus.svg",
                                    ),
                                  ),
        
                                  Gap(10),
        
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffE2E2E2),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: qty[index].toString(),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
        
                                  Gap(10),
        
                                  // زر +
                                  GestureDetector(
                                    onTap: () => increment(index),
                                    child: SvgPicture.asset(
                                      "assets/svgs/Vector (1).svg",
                                    ),
                                  ),
        
                                  Spacer(),
        
                                  CustomText(color: Colors.black, text: "\$40"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
        
                    Gap(20),
                    Divider(),
                  ],
                );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Total", color: Colors.black,fontsize: 24,),
                  CustomText(text: "\$40", color: Colors.black,fontsize: 24,),
                ],
              ),
              Gap(10),
              CustomButton(title: "Go to Checkout", color: Color(0xff53B175), svgs: false, svg: "",  onTap: (){
                return showCheckoutSheet(context);
              }, fontcolor: Colors.white,)
            ],
          ),
        ),

      ),
    );
  }
}
void showCheckoutSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            const SizedBox(height: 20),

            /// Delivery Row
            buildCheckoutRow(
              title: "Delivery",
              value: "Select Method",
              onTap: () {},
            ),

            /// Payment Row
            buildCheckoutRow(
              title: "Payment",
              value: "Pay",
              icon: Icons.credit_card,
              onTap: () {},
            ),

            /// Promo Row
            buildCheckoutRow(
              title: "Promo Code",
              value: "Pick discount",
              onTap: () {},
            ),

            /// Total Cost Row
            buildCheckoutRow(
              title: "Total Cost",
              value: "\$13.97",
              onTap: () {},
            ),

            const SizedBox(height: 15),

            /// Terms
            const Text(
              "By placing an order you agree to our\nTerms And Conditions",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),

            const SizedBox(height: 20),

            /// Place Order Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Place Order",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}

/// 🔵 Widget reusable لصفوف الـ Checkout
Widget buildCheckoutRow({
  required String title,
  required String value,
  required VoidCallback onTap,
  IconData? icon,
}) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Left side
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              /// Right side
              Row(
                children: [
                  if (icon != null)
                    Icon(icon, size: 20, color: Colors.blue),

                  const SizedBox(width: 5),

                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(width: 5),
                  const Icon(Icons.arrow_forward_ios, size: 16)
                ],
              ),
            ],
          ),
        ),
      ),
      const Divider(height: 1),
    ],
  );
}
