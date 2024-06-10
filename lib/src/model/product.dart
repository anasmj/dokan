import 'dart:convert';

import 'package:dokan/src/model/download.dart';
import 'package:dokan/src/model/image.dart';

class Product {
  final int? id;
  final String? name;
  final String? permalink;
  final String? dateCreated;

  final String? dateCreatedGmt;
  final String? dateModified;
  final String? dateModifiedGmt;
  final String? type;

  final String? status;
  final String? price;
  final String? regularPrice;
  final String? salePrice;

  final bool? onSale;
  final int? totalSales;
  final bool? virtual;
  final bool? downloadable;

  final List<Download>? downloads;
  final String? weight;
  final int? ratingCount;
  final String? averageRating;

  final List<ImageData>? images;

  Product({
    this.id,
    this.name,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.type,
    this.status,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.onSale,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.weight,
    this.ratingCount,
    this.averageRating,
    this.images,
  });

  Product copyWith({
    int? id,
    String? name,
    String? slug,
    String? permalink,
    String? dateCreated,
    String? dateCreatedGmt,
    String? dateModified,
    String? type,
    String? status,
    bool? featured,
    String? description,
    String? sku,
    String? price,
    String? regularPrice,
    String? salePrice,
    bool? onSale,
    bool? purchasable,
    int? totalSales,
    bool? virtual,
    bool? downloadable,
    List<Download>? downloads,
    String? backorders,
    bool? backordered,
    String? weight,
    int? ratingCount,
    String? averageRating,
    List<ImageData>? images,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      permalink: permalink ?? this.permalink,
      dateCreated: dateCreated ?? this.dateCreated,
      dateCreatedGmt: dateCreatedGmt ?? this.dateCreatedGmt,
      dateModified: dateModified ?? this.dateModified,
      type: type ?? this.type,
      status: status ?? this.status,
      price: price ?? this.price,
      regularPrice: regularPrice ?? this.regularPrice,
      salePrice: salePrice ?? this.salePrice,
      onSale: onSale ?? this.onSale,
      totalSales: totalSales ?? this.totalSales,
      virtual: virtual ?? this.virtual,
      downloadable: downloadable ?? this.downloadable,
      downloads: downloads ?? this.downloads,
      weight: weight ?? this.weight,
      ratingCount: ratingCount ?? this.ratingCount,
      averageRating: averageRating ?? this.averageRating,
      images: images ?? this.images,
    );
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    // print(
    //     'price: ${map['price']} || regular : ${map['regular_price']} || sale : ${map['sale_price']} ');
    return Product(
      id: map['id'].toInt() as int?,
      name: map['name'] as String?,
      permalink: map['permalink'] as String?,
      dateCreated: map['date_created'] as String?,
      dateCreatedGmt: map['date_created_gmt'] as String?,
      dateModified: map['date_modified'] as String?,
      type: map['type'] as String?,
      status: map['status'] as String?,
      price: map['price'] as String?,
      regularPrice: map['regular_price'] as String?,
      salePrice: map['sale_price'] as String?,
      onSale: map['on_sale'] as bool?,
      totalSales: map['total_sales'].toInt() as int?,
      virtual: map['virtual'] as bool?,
      downloadable: map['downloadable'] as bool?,
      downloads: map['downloads'] != null
          ? (map['downloads'] as List).map((d) => Download.fromMap(d)).toList()
          : null,
      images: map['images'] != null
          ? (map['images'] as List).map((d) => ImageData.fromMap(d)).toList()
          : null,
      weight: map['weight'] as String?,
      ratingCount: map['rating_count'].toInt() as int?,
      averageRating: map['average_rating'] as String?,
    );
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
  @override
  String toString() {
    return 'Product(id: $id, name: $name,  permalink: $permalink, type: $type, status: $status,price: $price, regular_price: $regularPrice, sale_price: $salePrice,  on_sale: $onSale, total_sales: $totalSales, virtual: $virtual, downloadable: $downloadable, downloads: $downloads,   average_rating: $averageRating, rating_count: $ratingCount,  images: $images)';
  }
}
