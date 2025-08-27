import 'package:flutter/material.dart';

class FeaturedCollectionsPage extends StatelessWidget {
  final String collectionId;

  FeaturedCollectionsPage({required this.collectionId});

  @override
  Widget build(BuildContext context) {
    // Fetch products from API here using collectionId
    return Scaffold(
      appBar: AppBar(title: Text("Products Bought Together")),
      body: Center(child: Text("Load products for $collectionId")),
    );
  }
}
