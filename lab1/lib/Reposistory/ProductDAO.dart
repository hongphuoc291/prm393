import 'package:lab1/Entity/Product.dart';

class ProductDAO {
  List<Product> products = Product.products;

  //add
  void addProduct(Product p) {
    products.add(p);
  }

  //list
  List<Product> showAll() {
    return products;
  }

  //find
  Product? findById(int id) {
    return products.firstWhere(
          (p) => p.id == id,
      orElse: () => Product(id: -1, name: "Not found", image: "", price: 0),
    );
  }

  //edit
  void editProduct(Product pNew) {
    int index = products.indexWhere((p) => p.id == pNew.id);
    if (index != -1) {
      products[index] = pNew;
    }
  }

  //delete
  void deleteProduct(int id) {
    products.removeWhere((p) => p.id == id);
  }

  //search
  List<Product> searchByName(String keyword) {
    return products
        .where((p) => p.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  //increase price
  void increasePrice(double percent) {
    double factor = 1 + (percent / 100);

    products = products
        .map((p) => p.copyWith(price: p.price * factor))
        .toList();
  }

  //sort
  List<Product> sortByPriceAsc() {
    List<Product> result = [...products];
    result.sort((a, b) => a.price.compareTo(b.price));
    return result;
  }

  List<Product> sortByPriceDesc() {
    List<Product> result = [...products];
    result.sort((a, b) => b.price.compareTo(a.price));
    return result;
  }
}