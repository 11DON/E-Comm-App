import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = "https://fakestoreapi.com";

  static Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load products");
    }
  }

  static Future<List<dynamic>> fetchCategories() async {
    final response = await http.get(Uri.parse("$baseUrl/products/categories"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load categories");
    }
  }
}
