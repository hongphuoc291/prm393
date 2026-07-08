import 'package:flutter/material.dart';
import 'package:store_he181356/Entity/Product.dart';
import 'package:store_he181356/Views/Pages/ProductDetailPage.dart';
import 'package:store_he181356/Reposistory/ProductDAO.dart';



class ProductListWidget extends StatefulWidget {
  const ProductListWidget({super.key});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  final ProductDAO _productDAO = ProductDAO(Product.products);
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = _productDAO.getAllProduct();
  }

  void _search(String keyword) {
    setState(() {
      filteredProducts = _productDAO.findProductByName(keyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: _search,
              decoration: InputDecoration(
                hintText: "Search product...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                children: filteredProducts.map((product) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width < 700
                        ? MediaQuery.of(context).size.width
                        : MediaQuery.of(context).size.width / 2,
                    child: ProductWidget(product: product),
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(product: product),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  product.image,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          "\$${(product.price).toStringAsFixed(0)}",
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "\$${(product.price * (1 - product.discountPercen / 100)).toStringAsFixed(0)}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text(
                  "-${product.discountPercen}%",
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}