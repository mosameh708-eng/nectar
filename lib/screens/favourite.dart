import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:nectar/screens/shop.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_text.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _CartState();
}

class _CartState extends State<Favourite> {
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
              CustomText(text: "Favorite", color: Colors.black, fontsize: 24),
              Gap(20),
              Divider(),

              ...List.generate(5, (index) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/product/banana.png", width: 120),

                        Gap(20),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      text: "Organic Bananas",
                                      color: Colors.black,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    "assets/svgs/Group 6862.svg",
                                  ),
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

              Gap(10),
              CustomButton(
                title: "Add All To Cart",
                color: Color(0xff53B175),
                svgs: false,
                svg: "",
                onTap: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => buildFailedDialog(context),
                  );
                }, fontcolor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildFailedDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    contentPadding: EdgeInsets.zero,
    content: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          Image.asset("assets/logo/image 13.png", width: 150, height: 150),

          Gap(20),

          Text(
            "Oops! Order Failed",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          Gap(20),

          Text(
            "Something went terribly wrong.",
            style: TextStyle(color: Colors.grey, fontSize: 15),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Please Try Again",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),

          Gap(10),

          GestureDetector(
            onTap: () {
              
            },
            child: Text(
              "Back to home",
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
          ),

         Gap(15),
        ],
      ),
    ),
  );
}
