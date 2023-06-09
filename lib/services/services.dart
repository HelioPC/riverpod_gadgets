import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gadgets/model/product.dart';
import 'package:http/http.dart';

class ApiServices {
  final String endPoint = 'https://dummyjson.com/products/';

  Future<List<Product>> getProducts() async {
    final response = await get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['products'];

      print(results[0]);

      return results.map((e) => Product.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}

final productsProvider = Provider<ApiServices>((ref) => ApiServices());
