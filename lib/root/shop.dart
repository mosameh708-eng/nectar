import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/product_data/product_model.dart';
import 'package:nectar/widgets/cart/custom_cart.dart';
import 'package:nectar/widgets/custom_search_text_field.dart';
import 'package:nectar/widgets/custom_text.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Gap(50),
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
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: ProductModel.products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = ProductModel.products[index];
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: CustomCart(
                        image: item.image,
                        name: item.name,
                        qty: item.qty,
                        price: item.price,
                        desc: item.desc,
                        bordercolor: Color(0xffE2E2E2) ,
                        containercolor: Colors.white,
                      ),
                    );
                  },
                ),
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Best Selling",
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
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomCart(
                      image: "assets/product/felfel.png",
                      name: "Felfel",
                      qty: 1,
                      price: 30,
                      desc: "felfel is very good",
                      bordercolor: Color(0xffE2E2E2) ,
                      containercolor: Colors.white,
                    );
                    },
                ),
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Groceries",
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







              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Best Selling",
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
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
