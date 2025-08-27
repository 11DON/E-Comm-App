import 'package:ecommerc/pages/cart_screen.dart';
import 'package:ecommerc/pages/categories.dart';
import 'package:ecommerc/pages/home_screen.dart';
import 'package:ecommerc/pages/profile_screen.dart';
import 'package:ecommerc/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class GoogleNavigationBar extends StatefulWidget {
  const GoogleNavigationBar({super.key});

  @override
  State<GoogleNavigationBar> createState() => _GoogleNavigationBarState();
}

class _GoogleNavigationBarState extends State<GoogleNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);

    const pages = [
      HomeScreen(),
      CategoriesPage(),
      CartScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      body: IndexedStack(index: navProvider.currentIndex, children: pages),
      bottomNavigationBar: GNav(
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceOut,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        gap: 8,
        backgroundColor: Colors.black,
        tabBackgroundColor: Colors.grey,
        selectedIndex: navProvider.currentIndex,
        activeColor: Colors.black,
        color: Colors.white,
        tabBorderRadius: 25,
        rippleColor: Colors.white,
        textStyle: TextStyle(color: Colors.black),
        onTabChange: (index) => navProvider.setIndex(index),
        tabs: [
          GButton(icon: Icons.home, text: "Home"),
          GButton(icon: Icons.category, text: "Category"),
          GButton(icon: Icons.shopping_cart_checkout_outlined, text: "Cart"),
          GButton(icon: Icons.person, text: "Profile"),
        ],
      ),
    );
  }
}
