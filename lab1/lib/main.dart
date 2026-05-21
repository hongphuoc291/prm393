import 'dart:io';
import 'package:lab1/Entity/Product.dart';
import 'package:lab1/Reposistory/ProductDAO.dart';

void main() {
  ProductDAO dao = ProductDAO();
  while (true) {

    print("\n===== MENU =====");
    print("1. Show all");
    print("2. Sort ascending");
    print("3. Sort descending");
    print("4. Add product");
    print("5. Update product");
    print("6. Delete product");
    print("7. Search product");
    print("8. Increase price");
    print("0. Exit");

    print("Choose:");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        dao.showAll().forEach(print);
        break;

      case 2:
        dao.sortByPriceAsc().forEach((p) => print("id: ${p.id}, name: ${p.name}, image: ${p.image}, price: ${p.price}"));
        break;

      case 3:
        dao.sortByPriceDesc().forEach((p) => print("id: ${p.id}, name: ${p.name}, image: ${p.image}, price: ${p.price}"));
        break;


      case 4:
        print("ID:");
        int id = int.parse(stdin.readLineSync()!);

        print("Name:");
        String name = stdin.readLineSync()!;

        print("Image:");
        String image = stdin.readLineSync()!;

        print("Price:");
        double price = double.parse(stdin.readLineSync()!);

        dao.addProduct(Product(id: id, name: name, image: image, price: price));
        break;

      case 5:
        print("ID update:");
        int id = int.parse(stdin.readLineSync()!);

        print("New name:");
        String name = stdin.readLineSync()!;

        print("New image:");
        String image = stdin.readLineSync()!;

        print("New price:");
        double price = double.parse(stdin.readLineSync()!);

        dao.editProduct(Product(id: id, name: name, image: image, price: price));
        break;

      case 6:
        print("ID delete:");
        int id = int.parse(stdin.readLineSync()!);
        dao.deleteProduct(id);
        break;

      case 7:
        print("Enter keyword:");
        String key = stdin.readLineSync()!;
        dao.searchByName(key).forEach((p) => print("id: ${p.id}, name: ${p.name}, image: ${p.image}, price: ${p.price}"));
        break;

      case 8:
        print("Enter percentage increase: ");
        double percent = double.parse(stdin.readLineSync()!);
        dao.increasePrice(percent);
        print("Price increased by $percent%");
        break;

      case 0:
        print("Exit program");
        return;

      default:
        print("Invalid choice");
    }
  }
}


