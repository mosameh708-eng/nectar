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
        nutritious: "100g",
        desc: "Bananas are important for their rich nutritional profile,\n including potassium, vitamin B6, vitamin C, and fiber,\n which support heart health",
        name: "Organic Banana ",
        qty: 1,
        price:25,

    ),
    ProductModel(
        image: "assets/product/pngfuel 1.png",
        nutritious: "250g",
        desc: "Apples are nutritious. Apples may be good for weight loss.\n apples may be good for your heart.\n As part of a healtful and varied diet.",
        name: "RedApple",
        qty: 1,
        price:30
    ),
    ProductModel(
        image: "assets/product/pngfuel 3.png",
        nutritious: "150g",
        desc: "Ananas, or pineapple, is important for its nutritional value,\n unique flavor, and medicinal properties.\n It is a rich source of vitamins (especially C and B) ",
        name: 'Ananas',
        qty: 1,
        price:20,
    ),
    ProductModel(
      image: "assets/product/pngfuel 4.png",
      nutritious: "300g",
      desc: "Beef bones are nutrient-rich parts of a cow, primarily used to make flavorful stocks, broths, and soups by simmering,\n extracting minerals, collagen, and marrow, but they're also used for pet treats or roasted for marrow. ",
      name: 'Beef Bone',
      qty: 1,
      price:100,
    ),
    ProductModel(
      image: "assets/product/felfel.png",
      nutritious: "70g",
      desc: "Red pepper can refer to the sweet, mild red bell pepper (a mature green pepper) or spicy varieties like cayenne/chili peppers,\n which are the dried,\n ground fruits used as a pungent spice, both come from Capsicum annuum but offer different flavors. ",
      name: 'Res pepper',
      qty: 1,
      price:20,
    ),
    ProductModel(
      image: "assets/product/pngfuel 8.png",
      nutritious: "270g",
      desc: "Olive oil, especially extra virgin, offers benefits like improved heart health (lowers bad cholesterol, raises good),\n strong anti-inflammatory and antioxidant effects. ",
      name: 'Olive oil',
      qty: 1,
      price:85,
    ),
    ProductModel(
      image: "assets/product/pngfuel 11.png",
      nutritious: "125g",
      desc: " Diet Coke is offering a sweet, soda-like taste with virtually zero calories and no sugar, making it a popular\n choice for calorie reduction and managing sugar intake,\n especially for those with diabetes or trying to lose weight.",
      name: 'Diet Coke',
      qty: 1,
      price:15,
    ),
    ProductModel(
      image: "assets/product/tomato.jpg",
      nutritious: "60g",
      desc: "Tomatoes are packed with antioxidants like lycopene and vitamins (C, A, K) that support heart health,\n boost immunity, protect skin, improve vision, and may lower risks of certain cancers.",
      name: 'Tomato',
      qty: 1,
      price:20 ,
    ),
    ProductModel(
      image: "assets/product/cucumber.jfif",
      nutritious: "300gram",
      desc: "Cucumbers are hydrating, low-calorie, and packed with nutrients like Vitamin K, potassium, and magnesium,\n offering benefits such as supporting weight loss,\n improving digestion, regulating blood sugar.",
      name: 'Cucumber',
      qty: 1,
      price:25,
    ),
    ProductModel(
      image: "assets/product/potatos.jpeg",
      nutritious: "300gram",
      desc: "Cucumbers are hydrating, low-calorie, and packed with nutrients like Vitamin K, potassium, and magnesium,\n offering benefits such as supporting weight loss,\n improving digestion, regulating blood sugar.",
      name: 'Potatoes',
      qty: 1,
      price:15,
    ),


  ];
}
