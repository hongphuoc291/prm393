import 'package:kiemtra_he181356/Entity/Product.dart';

class ProductDAO {
  final List<Product> products;

  ProductDAO(this.products);

  List<Product> getAllProduct() {
    return products;
  }

  List<Product> findProductByName(String keyword) {
    return products
        .where((p) => p.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}