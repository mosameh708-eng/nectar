import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/product_data/product_model.dart';
import 'package:nectar/widgets/custom_text.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
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
              ProductModel.favorites.isEmpty
                  ? const Center(
                      child: CustomText(
                        text: "No favorites yet",
                        color: Colors.black,
                        fontsize: 18,
                      ),
                    )
                  : Column(
                      children: List.generate(ProductModel.favorites.length, (
                        index,
                      ) {
                        final product = ProductModel.favorites[index];
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(product.image, width: 120),
                                Gap(20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomText(
                                              text: product.name,
                                              color: Colors.black,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                ProductModel.removeFromFavorites(
                                                  product.name,
                                                );
                                              });
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(10),
                                      CustomText(
                                        text: product.nutritious,
                                        color: Colors.black,
                                        fontsize: 14,
                                      ),
                                      Gap(15),
                                      CustomText(
                                        text: "\$${product.price}",
                                        color: const Color(0xff53B175),
                                        fontsize: 16,
                                        weight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                          ],
                        );
                      }),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
