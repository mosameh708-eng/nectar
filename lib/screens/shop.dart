import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nectar/product_data/product_model.dart';
import 'package:nectar/widgets/cart/add_to.dart';
import 'package:nectar/widgets/cart/custom_cart.dart';
import 'package:nectar/widgets/custom_search_text_field.dart';
import 'package:nectar/widgets/custom_text.dart';

class Shop extends StatelessWidget {
  const Shop({super.key, required this.zones});
  final String zones;
 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(10),
              SvgPicture.asset("assets/svgs/Group.svg",width: 30,),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svgs/Exclude.svg",width: 20,),
                  Gap(5),
                  CustomText(text: zones, color: Color(0xff4C4F4D))

                ],
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomSearchTextField(),
              ),
              Gap(15),
              Image.asset("assets/logo/banner.png"),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Exclusive Offer",
                    color: Colors.black,
                    fontsize: 24,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomText(
                      text: "See all",
                      color: Color(0xff53B175),
                      fontsize: 16,
                    ),
                  ),
                ],
              ),
              Gap(20),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8),
              shrinkWrap: true,
              itemCount: ProductModel.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context,index){
                final item = ProductModel.products[index];
                return CustomCart(image: item.image, desc: item.desc, name: item.name, qty: item.qty, price: item.price, );

                }
            )
              

            ],
          ),
        ),
      ),
    );
  }
}
