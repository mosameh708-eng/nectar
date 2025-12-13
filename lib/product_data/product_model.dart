class ProductModel {
  final String image;
  final String name;
  final String desc;
  final String nutritious;
  final int qty;
  final int price;


  ProductModel({
    required this.image,
    required this.nutritious,
    required this.desc,
    required this.name,
    required this.qty,
    required this.price,
  });
  static List<ProductModel> products = [
    ProductModel(
        image: "assets/product/banana.png",
        nutritious: "100gram",
        desc: "Bananas are important for their rich nutritional profile,\n including potassium, vitamin B6, vitamin C, and fiber,\n which support heart health",
        name: "Organic Banana ",
        qty: 1,
        price:60,

    ),
    ProductModel(
        image: "assets/product/pngfuel 1.png",
        nutritious: "250gram",
        desc: "Apples are nutritious. Apples may be good for weight loss.\n apples may be good for your heart.\n As part of a healtful and varied diet.",
        name: "RedApple",
        qty: 1,
        price:40
    ),
    ProductModel(
        image: "assets/product/pngfuel 3.png",
        nutritious: "150gram",
        desc: "Ananas, or pineapple, is important for its nutritional value,\n unique flavor, and medicinal properties.\n It is a rich source of vitamins (especially C and B) ",
        name: 'Ananas',
        qty: 1,
        price:70,
    ),
    ProductModel(
      image: "assets/product/pngfuel 3.png",
      nutritious: "200gram",
      desc: "Ananas, or pineapple, is important for its nutritional value,\n unique flavor, and medicinal properties.\n It is a rich source of vitamins (especially C and B) ",
      name: 'Ananas',
      qty: 1,
      price:70,
    ),
    ProductModel(
      image: "assets/product/pngfuel 3.png",
      nutritious: "300gram",
      desc: "Ananas, or pineapple, is important for its nutritional value,\n unique flavor, and medicinal properties.\n It is a rich source of vitamins (especially C and B) ",
      name: 'Ananas',
      qty: 1,
      price:70,
    )
  ];
}
