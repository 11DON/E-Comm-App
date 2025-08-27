import 'package:ecommerc/pages/category_product_page.dart';
import 'package:ecommerc/pages/featured_collections_page.dart';
import 'package:ecommerc/pages/product_detail_screen.dart';
import 'package:ecommerc/services/api_services.dart';
import 'package:ecommerc/widgest/category_card.dart';
import 'package:ecommerc/widgest/my_search_filed.dart';
import 'package:ecommerc/widgest/product_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> _productsFuture;

  final List<Map<String, String>> featuredCollections = [
    {
      "id": "1",
      "title": "Smart Home Essentials",
      "desc": "Upgrade your living space with cutting-edge smart technology.",
      "image": "lib/assets/images/smart_home.jpg",
    },
    {
      "id": "2",
      "title": "Cozy Living Collection",
      "desc":
          "Discover comfort and style for your home with our latest furniture.",
      "image": "lib/assets/images/cozy_home.jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
    _productsFuture = ApiServices.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Flutter Shop',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // aligns everything left
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MySearchField(
                controller: controller,
                onChanged: (value) {
                  print("Searching: $value");
                },
              ),
            ),

            // **************************************************
            // *************Product Categories********************
            // ************************************************
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Products Categories',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(
                      icon: Icons.phone_iphone,
                      label: "Electronics",
                      id: 2,
                      width: 90,
                      height: 50,
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
                      width: 90,
                      height: 50,
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
                      width: 90,
                      height: 50,
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
                      width: 90,
                      height: 50,
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
            ),

            // **************************************************
            // *************Featured Collections********************
            // ************************************************
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Featured Collections',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featuredCollections.length,
                itemBuilder: (context, index) {
                  final item = featuredCollections[index];
                  return Container(
                    width: 300,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(item["image"]!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black.withValues(alpha: 0.3),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          bottom: 15,
                          right: 15,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                item["desc"] ?? "",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 40,
                                width: 110,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2E4B60),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          FeaturedCollectionsPage(
                                            collectionId: item['title']!,
                                          ),
                                    ),
                                  ),
                                  child: Center(
                                    child: const Text(
                                      "Explore Now",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10),

            // **************************************************
            // *************POPULAR PRODUCTS********************
            // ************************************************
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Popular Products',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            FutureBuilder<List<dynamic>>(
              future: _productsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text(
                    "Error: ${snapshot.error}",
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  final products = snapshot.data!;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.75,
                        ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        image: product['image']!,
                        title: product['title'],
                        price: product["price"].toDouble(),
                        Category: product['category'] ?? "No Category",
                        ontap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailScreen(product: product),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
