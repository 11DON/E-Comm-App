import 'package:ecommerc/widgest/my_button.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final rating = product['rating']?['rate'] ?? 0.0;
    final reviewCount = product['rating']?['count'] ?? 0;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Product Details", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.network(product['image'], height: 250, fit: BoxFit.cover),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['title'],
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "\$${product['price']}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.blue, size: 30),
                            SizedBox(width: 5),
                            Text(
                              "$rating ($reviewCount reviews)",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  product['description'],
                  maxLines: 4,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: MyButton(
                  color: Color(0xFF343F65),
                  height: 60,
                  ontap: () {},
                  title: "Add to Cart | \$${product['price']}",
                  width: 250,
                  fontsize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
