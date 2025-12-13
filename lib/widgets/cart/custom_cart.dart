import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/screens/product_details.dart';
import 'package:nectar/widgets/cart/add_to.dart';
import 'package:nectar/widgets/custom_text.dart';

class CustomCart extends StatelessWidget {
  const CustomCart(
{super.key,
    required this.image,
    required this.desc,
    required this.name,
    required this.qty,
    required this.price, 
  required this.bordercolor, 
  required this.containercolor,
  });
  final String image,desc, name;
     final int qty,price;
     final Color bordercolor;
     final Color containercolor;

  @override
  Widget build(BuildContext context) {
    return  Container(
       width: 180,height: 260,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
          border: Border.all(color: bordercolor),),
        child: Column(
          children: [
            Gap(10),
            Expanded(child: Image.asset(image,width: 90,height: 90,)),
            Gap(5),
            CustomText(text: name, color: Colors.black),
            Gap(2),
            CustomText(text: qty.toString(), color: Colors.black),
            Gap(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: price.toString(), color: Colors.black),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (c)=>ProductDetails(image: image, desc: desc, name: name, qty: qty, price: price)));
                    }




                     , child: AddTo())
                ],
              ),
            )

          ],
        ),






    );
  }
}
