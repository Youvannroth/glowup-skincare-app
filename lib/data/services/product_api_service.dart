import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/constants/api_constants.dart';
import '../models/api_product.dart';

class ProductApiService {
  Future<List<ApiProduct>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}/products'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => ApiProduct.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }

  Future<List<ApiProduct>> fetchProductsByCategory(String category) async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}/products/category/$category'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => ApiProduct.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load category products: ${response.statusCode}');
    }
  }
}