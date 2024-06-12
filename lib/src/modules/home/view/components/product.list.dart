import 'package:dokan/src/extensions/extensions.dart';
import 'package:dokan/src/modules/home/components/product.card.dart';
import 'package:dokan/src/modules/home/components/search.bar.dart';
import 'package:dokan/src/modules/home/providers/product.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          title: Text(
            'Product List',
            style:
                context.text.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 18,
              ),
            )
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: AppSearchBar(),
            ),
          ),
        ),
      ],
      body: ref.watch(productsProvider).when(
            data: (products) {
              print(products.length);
              return GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (_, index) => ProductCard(
                  product: products[index],
                ),
              );
            },
            error: (e, s) {
              print(e);
              return const SizedBox(
                child: Text('Error'),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
