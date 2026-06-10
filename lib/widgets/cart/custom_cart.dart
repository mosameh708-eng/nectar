import 'package:flutter/material.dart';
import 'package:nectar/product_data/product_model.dart';
import 'package:nectar/root.dart';
import 'package:nectar/screens/product_details.dart';
import 'package:nectar/widgets/custom_text.dart';

class CustomCart extends StatelessWidget {
  const CustomCart({
    super.key,
    required this.image,
    required this.desc,
    required this.name,
    required this.qty,
    required this.price,
    required this.nutritions,
    this.bordercolor,
    this.containercolor,
  });

  final String image;
  final String desc;
  final String name;
  final String nutritions;
  final int qty;
  final int price;
  final Color? bordercolor;
  final Color? containercolor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: bordercolor ?? Colors.grey.shade200),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetails(
                image: image,
                desc: desc,
                name: name,
                qty: qty,
                price: price,
                nutritions: nutritions,
                fav: false,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  width: 150,
                  height: 150,
                ),
              ),

              const SizedBox(height: 10),

              CustomText(text: name, color: Colors.black),

              const SizedBox(height: 4),

              Text(
                "${qty}kg",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),

              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "\$$price", color: Colors.black),

                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      ProductModel.addToCart(
                        ProductModel(
                          image: image,
                          nutritious: nutritions,
                          desc: desc,
                          name: name,
                          qty: qty,
                          price: price,
                        ),
                        1,
                      );

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              Root(initialPage: 1, zone: Root.currentZone),
                        ),
                        (route) => false,
                      );
                    },
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xff53B175),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
