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
 //sắp xếp giá tăng
  static List<Product> sortByPriceAsc() {
    List<Product> result = [...products];
    result.sort((a, b) => a.price.compareTo(b.price));
    return result;
  }

  //sắp xếp giá giảm
  static List<Product> sortByPriceDesc() {
    List<Product> result = [...products];
    result.sort((a, b) => b.price.compareTo(a.price));
    return result;
  }

  //add
  static void addProduct(Product p) {
    products.add(p);
  }


  // Delete product by Id
  static void deleteProduct(int id) {
    products.removeWhere((p) => p.id == id);
  }

  // Update product by Id
  static void updateProduct(int id, String newName, double newPrice) {
    int index = products.indexWhere((p) => p.id == id);
    if (index != -1) {
      products[index] = Product(
          id: id,
          name: newName,
          image: products[index].image,
          price: newPrice
      );
    } else {
      print("Can not found product ID: $id");
    }
  }

  // Search by name
  static List<Product> searchByName(String keyword) {
    return products
        .where((p) => p.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}