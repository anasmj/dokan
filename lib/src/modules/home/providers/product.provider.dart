import 'dart:convert';

// import 'package:dokan/src/model/product.dart';
import 'package:dokan/src/model/product.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'filters.provider.dart';

late final List<Product> products;

final productsProvider =
    AsyncNotifierProvider<ProductProvder, List<Product>>(ProductProvder.new);

class ProductProvder extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    String jsonString = await rootBundle.loadString('assets/response.json');
    final jsonData = jsonDecode(jsonString) as List;
    return jsonData.map((e) => Product.fromMap(e)).toList();
  }

  void applyFilter(List<Filter> filters) {
    if (filters.isNotEmpty) {
      List<Product> filtered = state.value!;
      for (var filter in filters) {
        filtered = getFiltered(filtered, filter);
      }
      state = AsyncData(filtered);
    }
  }

  List<Product> getFiltered(List<Product> products, Filter filter) {
    List<Product> sorted = products;
    if (filter == Filter.priceAscending) {
      sorted = products..sort((a, b) => a.price!.compareTo(b.price!));
    } else if (filter == Filter.priceDescending) {
      sorted = products..sort((a, b) => b.price!.compareTo(a.price!));
    } else if (filter == Filter.newwest) {
      sorted = products
        ..sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));
    } else if (filter == Filter.oldest) {
      sorted = products
        ..sort((a, b) => a.dateCreated!.compareTo(b.dateCreated!));
    } else if (filter == Filter.bestSelling) {
      sorted = products..sort((a, b) => b.totalSales!.compareTo(a.totalSales!));
    }
    return sorted;
  }
}
