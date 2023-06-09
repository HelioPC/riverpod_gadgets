import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gadgets/model/product.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String endPoint = 'https://dummyjson.com/products/';

  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse(endPoint));

      if (response.statusCode == 200) {
        final List<dynamic> results = jsonDecode(response.body)['products'];

        return results.map((e) => Product.fromJson(e)).toList();
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}

final productsProvider = Provider<ApiServices>((ref) => ApiServices());
