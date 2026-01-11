import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nectar/widgets/cart/cart.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/cart/custom_cart.dart';
import 'package:nectar/widgets/custom_navigate.dart';
import 'package:nectar/widgets/custom_text.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    required this.image,
    required this.desc,
    required this.name,
    required this.qty,
    required this.price,
    required this.nutritions,
    required this.fav,
  });

  final String image;
  final String desc;
  final String name;
  final int qty;
  final int price;
  final String nutritions;
  final bool fav;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 1;
  late bool isFav;

  @override
  void initState() {
    super.initState();
    isFav = widget.fav;
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 220,
            decoration: const BoxDecoration(
              color: Color(0xffF2F3F2),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomNavigate(),
                      SvgPicture.asset("assets/svgs/Vector.svg"),
                    ],
                  ),
                ),
                const Gap(20),
                Image.asset(widget.image, width: 150, fit: BoxFit.cover),
              ],
            ),
          ),

          const Gap(10),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: widget.name,
                          color: const Color(0xff181725),
                          fontsize: 24,
                        ),

                        /// ❤️ Favorite Icon
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFav = !isFav;
                            });
                          },
                          child: SvgPicture.asset(
                            "assets/svgs/bookmark 1.svg",
                            color: isFav ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    Align(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                        text: "${qty}k",
                        color: const Color(0xff7C7C7C),
                      ),
                    ),

                    const Gap(30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: decrementnumber,
                              child: SvgPicture.asset("assets/svgs/minus.svg"),
                            ),
                            const Gap(10),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xffE2E2E2)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: CustomText(
                                text: qty.toString(),
                                color: Colors.black,
                              ),
                            ),
                            const Gap(10),
                            GestureDetector(
                              onTap: incrementnumber,
                              child: SvgPicture.asset("assets/svgs/Vector (1).svg"),
                            ),
                          ],
                        ),
                        CustomText(
                          text: "\$${widget.price * qty}",
                          color: Colors.black,
                          fontsize: 24,
                        ),
                      ],
                    ),

                    const Divider(),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Product Detail",
                            color: Colors.black,
                            fontsize: 24,
                          ),
                          const Gap(5),
                          CustomText(
                            text: widget.desc,
                            color: const Color(0xff7C7C7C),
                          ),
                        ],
                      ),
                    ),

                    const Divider(),

                    Row(
                      children: [
                        const CustomText(text: "Nutritions", color: Colors.black),
                        const Spacer(),
                        CustomText(
                          text: widget.nutritions,
                          fontsize: 12,
                          weight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ],
                    ),

                    const Divider(),

                    Row(
                      children: const [
                        CustomText(text: "Review", color: Colors.black),
                        Spacer(),
                        Text("⭐⭐⭐⭐⭐"),
                      ],
                    ),

                    const Gap(20),

                    CustomButton(
                      title: "Add To Basket",
                      color: const Color(0xff53B175),
                      svgs: false,
                      svg: '',
                      fontcolor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Cart(
                              image: widget.image,
                              desc: widget.desc,
                              name: widget.name,
                              qty: widget.qty,
                              price: widget.price,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
