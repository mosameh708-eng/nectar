import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:nectar/product_data/product_model.dart';

import 'custom_text.dart';

class CustomCartCheckout extends StatefulWidget {
  const CustomCartCheckout({
    super.key,
    required this.image,
    required this.desc,
    required this.name,
    required this.qty,
    required this.price,
    required this.onRemove,
  });
  final String image;
  final String desc;
  final String name;
  final int qty;
  final int price;
  final VoidCallback onRemove;

  @override
  State<CustomCartCheckout> createState() => _CustomCartCheckoutState();
}

class _CustomCartCheckoutState extends State<CustomCartCheckout> {
  int qty = 1;

  void incrementnumber() {
    setState(() {
      qty++;
    });
  }

  void decrementnumber() {
    setState(() {
      if (qty > 1) {
        qty--;
      }
    });
  }

  void removeicon(index){
    final item=ProductModel.products[index];
    setState(() {
      ProductModel.products.removeAt(index);
    });

  }









  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 6,
        shadowColor: Colors.black,
        color: Colors.white,
        child: Column(
          children: [
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Image.asset(widget.image, width: 150),
                  Gap(60),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(10),
                        CustomText(text: widget.name, color: Colors.black),
                        CustomText(
                          text: qty.toString(),
                          color: Colors.grey,
                          fontsize: 16,
                        ),
                        Gap(15),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: decrementnumber,
                              child: SvgPicture.asset("assets/svgs/minus.svg"),
                            ),
                            Gap(10),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffE2E2E2)),
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: qty.toString(),
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Gap(10),
                            GestureDetector(
                              onTap: incrementnumber,
                              child: SvgPicture.asset(
                                "assets/svgs/Vector (1).svg",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: widget.onRemove,
                        child: Icon(Icons.close, color: Colors.grey),
                      ),
                      Gap(40),
                      CustomText(
                        text: "\$${widget.price * qty}",
                        color: Colors.black,
                      ),
                    ],
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

