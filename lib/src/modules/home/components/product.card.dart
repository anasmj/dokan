import 'package:dokan/src/extensions/extensions.dart';
import 'package:dokan/src/model/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, this.product});
  final Product? product;
  @override
  Widget build(BuildContext context) {
    // print(product?.totalSales);
    final imageUrl = product?.images?.first.src;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: imageUrl != null
                ? ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      fit: BoxFit.cover,
                      imageUrl,
                      errorBuilder: (_, __, ___) =>
                          const ColoredBox(color: Colors.blue),
                    ),
                  )
                : const ColoredBox(color: Colors.orange),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    product?.name ?? '',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${product?.regularPrice ?? 0}',
                        style: context.text.titleLarge!.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Text(
                          '\$${product?.price ?? 0}',
                          style: context.text.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Ratings(count: product?.averageRating),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Ratings extends StatelessWidget {
  const Ratings({super.key, this.count});
  final int? count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(6, (index) {
        return Icon(
          size: 18,
          Icons.star,
          color: index < count! ? Colors.amber : Colors.grey,
        );
      }),
    );
  }
}
