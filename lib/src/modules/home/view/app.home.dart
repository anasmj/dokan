import 'package:dokan/src/extensions/extensions.dart';
import 'package:dokan/src/modules/home/components/search.bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text(
              'Product List',
              style: context.text.titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
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
        body: const SizedBox(),
      ),
    );
  }
}
