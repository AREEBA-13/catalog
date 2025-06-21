class CatalogModel {
  static final items = [
    Item(
      color: "Red",
      id: "1",
      name: "Red Shirt",
      des: "A red shirt made of cotton.",
      price: 29.99,
      image: "assets/images/red_shirt.png",
    ),
  ];
}

class Item {
  final String id;
  final String name;
  final String des;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.des,
    required this.price,
    required this.color,
    required this.image,
  });
}
