import 'package:ecommerc/pages/product_details_screen2.dart';
import 'package:ecommerc/services/api_services_escuela.dart';
import 'package:flutter/material.dart';

import '../widgest/product_card.dart';

class CategoryProductsPage extends StatelessWidget {
  final int categoryId;
  final String categoryName;

  const CategoryProductsPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(categoryName, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: EscuelaApiServices.fetchProductsByCategory(categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            final products = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                // Ensure there's a valid image URL
                final String imageUrl =
                    (product['images'] != null &&
                        product['images'].isNotEmpty &&
                        product['images'][0].toString().startsWith('http'))
                    ? product['images'][0]
                    : 'https://via.placeholder.com/150'; // Fallback image

                return ProductCard(
                  image: imageUrl,
                  title: product['title'] ?? "No Title",
                  price: product['price']?.toDouble() ?? 0.0,
                  Category: product['slug'] ?? "No Category",
                  ontap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailScreen2(product: product),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
