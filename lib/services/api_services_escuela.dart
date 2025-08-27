import 'dart:convert';

import 'package:http/http.dart' as http;

class EscuelaApiServices {
  static const String baseUrl = "https://api.escuelajs.co/api/v1";

  static Future<List<dynamic>> fetchCategoris() async {
    final response = await http.get(Uri.parse("$baseUrl/categories"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load categories from Escuela API");
    }
  }

  static Future<List<dynamic>> fetchProductsByCategory(int categoryId) async {
    final response = await http.get(
      Uri.parse("$baseUrl/categories/$categoryId/products?offset=0&limit=10"),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load products for category $categoryId");
    }
  }
}
