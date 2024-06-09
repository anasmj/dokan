import 'dart:convert';

import 'package:dokan/src/model/product.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider =
    AsyncNotifierProvider<ProductProvder, List<Product>>(ProductProvder.new);

class ProductProvder extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    String jsonString = await rootBundle.loadString('assets/response.json');
    final jsonData = jsonDecode(jsonString) as List;
    return jsonData.map((e) => Product.fromMap(e)).toList();
  }
}
