import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nectar/root/cart.dart';
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


  });
  final String image;
  final String desc;
  final String name;
  final int qty;
  final int price;




  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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

  @override

  Widget build(BuildContext context) {
    bool isFav =true;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Color(0xffF2F3F2),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomNavigate(),
                      SvgPicture.asset("assets/svgs/Vector.svg"),
                    ],
                  ),
                ),
                Gap(20),
                Image.asset(widget.image,width: 150,fit:BoxFit.cover,),
              ],
            ),
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: widget.name, color: Color(0xff181725),fontsize: 24,),


            ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: "${qty.toString()}k",
                color: Color(0xff7C7C7C),
              ),
            ),
          ),
          Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                        border: Border.all(
                          color: Color(0xffE2E2E2)
                        ),
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
          ),
          Gap(30),
          Divider(),
          Gap(3),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "Product Detail", color: Colors.black,fontsize: 24,),
                  Gap(5),
                  CustomText(text: widget.desc, color: Color(0xff7C7C7C)),
                ],
              ),
            ),
          ),
          Gap(3),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: "Nutritions", color: Colors.black),
            ],
          ),
          Divider(),
          CustomButton(title: "Add To Basket", color: Color(0xff53B175), svgs: false, svg: '', onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (c)=>Cart()));
          }, fontcolor: Colors.white,
          )









          
        ]),

    );
  }
}
