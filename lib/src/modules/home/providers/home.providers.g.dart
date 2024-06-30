// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsNotifierHash() => r'abcf2b114b1f9b78f57838df0c73cd874d4a7c55';

/// See also [ProductsNotifier].
@ProviderFor(ProductsNotifier)
final productsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ProductsNotifier, List<Product>>.internal(
  ProductsNotifier.new,
  name: r'productsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductsNotifier = AutoDisposeAsyncNotifier<List<Product>>;
String _$filtersNotifierHash() => r'182ce4255ea519fb8df063ee8be56ff906b77f7d';

/// See also [FiltersNotifier].
@ProviderFor(FiltersNotifier)
final filtersNotifierProvider =
    AutoDisposeNotifierProvider<FiltersNotifier, List<Filter>>.internal(
  FiltersNotifier.new,
  name: r'filtersNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filtersNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FiltersNotifier = AutoDisposeNotifier<List<Filter>>;
String _$navOptionNotifierHash() => r'b72c1bb827df3df49480b347c5c41d024c9bc543';

/// See also [NavOptionNotifier].
@ProviderFor(NavOptionNotifier)
final navOptionNotifierProvider =
    AutoDisposeNotifierProvider<NavOptionNotifier, NavOption>.internal(
  NavOptionNotifier.new,
  name: r'navOptionNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$navOptionNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NavOptionNotifier = AutoDisposeNotifier<NavOption>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
