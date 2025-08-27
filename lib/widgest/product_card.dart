import 'package:ecommerc/models/product.dart';
import 'package:ecommerc/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final VoidCallback? ontap;
  final String Category;
  const ProductCard({
    super.key,
    this.ontap,
    required this.image,
    required this.title,
    required this.price,
    required this.Category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: ontap,
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Image.network(image, fit: BoxFit.contain),
            ),
          ),
          // ********************************
          // ************Title***************
          // ********************************
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              title,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // ********************************
          // ************Price***************
          // ********************************
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 17),
                ),
              ),
              Padding(
                // ********************************
                // ************Add To Cart*********
                // ********************************
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF2E4B60),
                  ),
                  child: IconButton(
                    onPressed: () {
                      final product = Product(
                        id: DateTime.now().millisecondsSinceEpoch,
                        title: title,
                        image: image,
                        price: price,
                        category: Category,
                      );
                      Provider.of<CartProvider>(
                        context,
                        listen: false,
                      ).addProduct(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${product.title} added to cart"),
                        ),
                      );
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
