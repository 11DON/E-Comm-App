import 'package:ecommerc/widgest/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/assets/images/logo.png', scale: 1.8),
                  Text(
                    'E-Com',
                    style: GoogleFonts.borel(
                      textStyle: const TextStyle(
                        fontSize: 44,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Your Journey to Effortless Style Begins Here!',
                  textAlign: TextAlign.center, // center text too
                  style: GoogleFonts.borel(
                    textStyle: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: MyButton(
                  title: "Explore FlutterShop",
                  color: Color(0xFF343F65),
                  height: 40,
                  width: 190,
                  ontap: () => Navigator.pushReplacementNamed(context, '/main'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
