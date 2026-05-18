class Product{
  final int id;
  final String name;
  final String image;
  final double price;
  Product({required this.id, required this.name, required this.image, required this.price});

  static List<Product> products =[
    Product(id: 1, name: "Peach", image: "peach.png", price: 50500),
    Product(id: 2, name: "Banana", image: "banana.png", price: 13000),
  ];

  static void showAll() {
    for (var p in products) {
      print("ID: ${p.id} - Name: ${p.name} - Price: ${p.price}");
    }
  }
}