import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String name;
  double price;
  final double discountPercen;
  final int starNumber;
  final String image;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPercen,
    required this.starNumber,
    required this.image
  });


  static List<Product> products = [
    Product(id: "S1", name: "Iphone 17", price: 60000, discountPercen:10, starNumber: 5, image:"assets/images/iphone.jpg"),
    Product(id: "S2", name: "Ipad Pro", price: 90000, discountPercen:5, starNumber: 5, image:"assets/images/ipad.jpg"),
    Product(id: "S3", name: "Macbook Air", price: 20000, discountPercen:50, starNumber: 4, image:"assets/images/mac.jpg"),

  ];
}