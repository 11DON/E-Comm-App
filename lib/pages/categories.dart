import 'package:ecommerc/pages/category_product_page.dart';
import 'package:ecommerc/widgest/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Categories", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
          children: [
            CategoryCard(
              icon: Icons.phone_iphone,
              label: "Electronics",
              id: 2,
              width: 150,
              height: 100,
              icon_size: 60,
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryProductsPage(
                      categoryId: 2,
                      categoryName: "Electronics",
                    ),
                  ),
                );
              },
            ),
            CategoryCard(
              icon: Icons.watch,
              label: "Accessories",
              id: 4,
              width: 150,
              height: 100,
              icon_size: 60,
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryProductsPage(
                      categoryId: 4,
                      categoryName: "Accessories",
                    ),
                  ),
                );
              },
            ),
            CategoryCard(
              icon: Icons.chair,
              label: "Home Goods",
              id: 3,
              width: 150,
              height: 100,
              icon_size: 60,
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryProductsPage(
                      categoryId: 3,
                      categoryName: "Home Goods",
                    ),
                  ),
                );
              },
            ),
            CategoryCard(
              icon: Icons.dry_cleaning_outlined,
              label: "Clothes",
              id: 1,
              width: 150,
              height: 100,
              icon_size: 60,
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryProductsPage(
                      categoryId: 1,
                      categoryName: "Clothes",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
