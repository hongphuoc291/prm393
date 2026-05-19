import 'package:lab1/Entities/Product.dart';

void main() {
  print("List Product");
  Product.showAll();

  print("Product list sorted by ascending price");
  var listAsc = Product.sortByPriceAsc();
  listAsc.forEach((p) => print("${p.name} - ${p.price}"));

  print("Product list sorted by descending price");
  var listDesc = Product.sortByPriceDesc();
  listDesc.forEach((p) => print("${p.name} - ${p.price}"));

//add
  Product.addProduct(Product(id: 3, name: "Apple", image: "apple.png", price: 23500,
  ));

  print("List Product");
  Product.showAll();


  print("Update successful");
  Product.updateProduct(1, "Premium Peach", 60000);
  Product.showAll();

  // delete
  print("Delete successful");
  Product.deleteProduct(2);
  Product.showAll();

  // search
  print("Search result");
  var searchResults = Product.searchByName("Ap");
  if (searchResults.isEmpty) {
    print("Can not found");
  } else {
    searchResults.forEach((p) => print("${p.name} - ${p.price}"));
  }
}


