import 'package:ecommerc/providers/cart_provider.dart';
import 'package:ecommerc/widgest/checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("My Cart", style: TextStyle(color: Colors.white)),
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                "Your Cart IS Empty",
                style: TextStyle(color: Colors.white),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final product = cart.items[index];
                      return Card(
                        color: Colors.grey[900],
                        margin: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: ListTile(
                          leading: Image.network(
                            product.image,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            product.title,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            "\$${product.price.toStringAsFixed(2)}",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              cart.removeProduct(product);
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: \$${cart.totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      CheckoutButton(
                        color: Color(0xFF343F65),
                        height: 60,
                        total: cart.totalPrice,
                        title: "Checkout",
                        width: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
