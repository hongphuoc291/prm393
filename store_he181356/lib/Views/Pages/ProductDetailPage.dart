import 'package:flutter/material.dart';
import 'package:store_he181356/Widgets/ProductWidget.dart';
import 'package:store_he181356/Entity/Product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              child: Image.asset(
                product.image,
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: \$${product.price}",
              style: const TextStyle(fontSize: 20, color: Colors.blueAccent, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.yellow, size: 28),
                const SizedBox(width: 4),
                Text(
                  "${product.starNumber}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}