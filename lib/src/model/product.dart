// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dokan/src/model/image.dart';

class Product {
  int? id;
  String? name;
  String? price;
  String? regularPrice;
  String? salePrice;
  bool? onSale;
  bool? purchasable;
  String? externalUrl;
  String? averageRating;
  int? ratingCount;
  List<ImageData>? images;
  Product({
    this.id,
    this.name,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.onSale,
    this.purchasable,
    this.externalUrl,
    this.averageRating,
    this.ratingCount,
    this.images,
  });

  Product copyWith({
    int? id,
    String? name,
    String? price,
    String? regularPrice,
    String? salePrice,
    bool? onSale,
    bool? purchasable,
    String? externalUrl,
    String? averageRating,
    int? ratingCount,
    List<ImageData>? images,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      regularPrice: regularPrice ?? this.regularPrice,
      salePrice: salePrice ?? this.salePrice,
      onSale: onSale ?? this.onSale,
      purchasable: purchasable ?? this.purchasable,
      externalUrl: externalUrl ?? this.externalUrl,
      averageRating: averageRating ?? this.averageRating,
      ratingCount: ratingCount ?? this.ratingCount,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'regularPrice': regularPrice,
      'salePrice': salePrice,
      'onSale': onSale,
      'purchasable': purchasable,
      'externalUrl': externalUrl,
      'averageRating': averageRating,
      'ratingCount': ratingCount,
      'images': images,
    };
  }

  static Product fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      regularPrice:
          map['regularPrice'] != null ? map['regularPrice'] as String : null,
      salePrice: map['salePrice'] != null ? map['salePrice'] as String : null,
      onSale: map['onSale'] != null ? map['onSale'] as bool : null,
      purchasable:
          map['purchasable'] != null ? map['purchasable'] as bool : null,
      externalUrl:
          map['externalUrl'] != null ? map['externalUrl'] as String : null,
      averageRating:
          map['averageRating'] != null ? map['averageRating'] as String : null,
      ratingCount:
          map['ratingCount'] != null ? map['ratingCount'] as int : null,
      images: map['images'] != null
          ? ((map['images']) as List).map((e) => ImageData.fromMap(e)).toList()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  Product fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, regularPrice: $regularPrice, salePrice: $salePrice, onSale: $onSale, purchasable: $purchasable, externalUrl: $externalUrl, averageRating: $averageRating, ratingCount: $ratingCount, images: $images)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.regularPrice == regularPrice &&
        other.salePrice == salePrice &&
        other.onSale == onSale &&
        other.purchasable == purchasable &&
        other.externalUrl == externalUrl &&
        other.averageRating == averageRating &&
        other.ratingCount == ratingCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        regularPrice.hashCode ^
        salePrice.hashCode ^
        onSale.hashCode ^
        purchasable.hashCode ^
        externalUrl.hashCode ^
        averageRating.hashCode ^
        ratingCount.hashCode;
  }
}
