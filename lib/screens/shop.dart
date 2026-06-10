import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/product_data/product_model.dart';
import 'package:nectar/widgets/cart/custom_cart.dart';
import 'package:nectar/widgets/custom_search_text_field.dart';
import 'package:nectar/widgets/custom_text.dart';

class Shop extends StatefulWidget {
  const Shop({super.key, required this.zones});
  final String zones;

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final TextEditingController searchController = TextEditingController();
  late List<ProductModel> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = List<ProductModel>.from(ProductModel.products);
  }

  void _filterProducts(String query) {
    final normalizedQuery = query.trim().toLowerCase();
    setState(() {
      if (normalizedQuery.isEmpty) {
        filteredProducts = List<ProductModel>.from(ProductModel.products);
      } else {
        filteredProducts = ProductModel.products.where((product) {
          final name = product.name.toLowerCase();
          final desc = product.desc.toLowerCase();
          return name.contains(normalizedQuery) ||
              desc.contains(normalizedQuery);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  SvgPicture.asset("assets/svgs/Group.svg", width: 40),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svgs/Exclude.svg", width: 20),
                      const SizedBox(width: 10),
                      CustomText(
                        text: widget.zones,
                        color: const Color(0xff4C4F4D),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Image.asset("assets/logo/banner.png", fit: BoxFit.cover),

                  const SizedBox(height: 20),

                  CustomSearchTextField(
                    controller: searchController,
                    onChanged: _filterProducts,
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = filteredProducts[index];
                return CustomCart(
                  image: item.image,
                  desc: item.desc,
                  name: item.name,
                  qty: item.qty,
                  price: item.price,
                  nutritions: item.nutritious,
                );
              }, childCount: filteredProducts.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
