import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gadgets/model/product.dart';
import 'package:gadgets/services/services.dart';

final dataProvider = FutureProvider<List<Product>>(
  (ref) async => await ref.watch(productsProvider).getProducts(),
);
