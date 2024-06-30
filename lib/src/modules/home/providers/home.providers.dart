import 'dart:convert';

import 'package:dokan/src/model/product.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'filters.provider.dart';
import 'nav.bar.provider.dart';
part 'home.providers.g.dart';

final isFilterAppliedProvider = StateProvider((ref) => false);

@riverpod
class ProductsNotifier extends _$ProductsNotifier {
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

@riverpod
class FiltersNotifier extends _$FiltersNotifier {
  @override
  List<Filter> build() => [];

  void onAddFilter(Filter f) {
    if (state.contains(f)) {
      state = [...state]..remove(f);
    } else {
      state = [...state, f];
    }
    if (f != Filter.bestSelling) _replaceDuplicateWithUpdated(f);
  }

  void _replaceDuplicateWithUpdated(Filter f) {
    ///remove duplicate newest and oldest
    if (state.contains(Filter.newwest) && state.contains(Filter.oldest)) {
      if (f == Filter.newwest) {
        state = [...state]..remove(Filter.oldest);
      } else {
        state = [...state]..remove(Filter.newwest);
      }
    }
    //remove duplicate price sort
    if (state.contains(Filter.priceAscending) &&
        state.contains(Filter.priceDescending)) {
      if (f == Filter.priceAscending) {
        state = [...state]..remove(Filter.priceDescending);
      } else {
        state = [...state]..remove(Filter.priceAscending);
      }
    }
  }
}

@riverpod
class NavOptionNotifier extends _$NavOptionNotifier {
  @override
  NavOption build() => NavOption.home;
  set setOption(NavOption op) => state = op;
}
