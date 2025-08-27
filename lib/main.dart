import 'package:ecommerc/pages/cart_screen.dart';
import 'package:ecommerc/pages/checkout_screen.dart';
import 'package:ecommerc/pages/google_navigation_bar.dart';
import 'package:ecommerc/pages/profile_screen.dart';
import 'package:ecommerc/pages/welcome_screen.dart';
import 'package:ecommerc/providers/cart_provider.dart';
import 'package:ecommerc/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey =
      "pk_test_51S07t7F1k4eaIDClz2K222sly429Wwn1slvPASkUbjpgIPIl1iPOqTBPTqWspPCcDxR258FYtCFxdpcaxKsRpUej00hqILZmIH";
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/main': (context) => const GoogleNavigationBar(),
        '/cart': (context) => const CartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
