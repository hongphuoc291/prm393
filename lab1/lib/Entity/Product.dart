import 'dart:io';
class Product{
  final int id;
  final String name;
  final String image;
  final double price;
  const Product({required this.id, required this.name, required this.image, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "price": price,
    };
  }

  Product copyWith({
    int? id,
    String? name,
    String? image,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }
  static List<Product> products =[
    Product(id: 1, name: "Peach", image: "peach.png", price: 50500),
    Product(id: 2, name: "Banana", image: "banana.png", price: 13000),
    Product(id: 3, name: "Apple", image: "apple.png", price: 20000),
  ];

  @override
  String toString() {
    return "id: $id, name: $name, image: $image, price: $price";
  }
}