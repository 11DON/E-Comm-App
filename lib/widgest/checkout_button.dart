import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class CheckoutButton extends StatelessWidget {
  final String title;
  final Color? color;
  final double? width;
  final double? height;
  final double? fontsize;
  final double total;
  const CheckoutButton({
    super.key,
    required this.color,
    required this.height,
    required this.title,
    required this.width,
    this.fontsize,
    required this.total,
  });

  Future<void> makePayment(BuildContext context) async {
    try {
      // 1-Call backend to Create Payment
      final response = await http.post(
        Uri.parse("http://10.0.2.2:3000/create-payment-intent"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"amount": (total * 100).toInt(), "currency": "usd"}),
      );
      final json = jsonDecode(response.body);
      final clientSecret = json['clientSecret'];
      // 2-Init payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "E-Comm",
        ),
      );
      // 3-Present payment sheet
      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Payment Successful!")));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Payment Failed:$e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        makePayment(context);
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontsize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
