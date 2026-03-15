import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';

class OrderApiService {
  Future<void> placeOrder({
    required String address,
    required String phone,
    required String paymentMethod,
    required double total,
    required List<Map<String, dynamic>> items,
  }) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}/orders'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'address': address,
        'phone': phone,
        'payment_method': paymentMethod,
        'total': total,
        'items': items,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to place order: ${response.body}');
    }
  }

  Future<List<dynamic>> getOrders() async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}/orders'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception('Failed to load orders');
  }
}