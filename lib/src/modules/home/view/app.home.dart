import 'dart:convert';

import 'package:dokan/src/components/gradient.button.dart';
import 'package:dokan/src/model/product.dart';
import 'package:dokan/src/modules/home/providers/nav.bar.provider.dart';
import 'package:dokan/src/modules/home/view/components/product.list.dart';
import 'package:dokan/src/modules/user/view/user.setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class AppHome extends ConsumerWidget {
  const AppHome({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final selectedNav = ref.watch(navProvider);
    Widget body;
    switch (selectedNav) {
      case NavOption.home:
        body = const ProductList();
      case NavOption.settings:
        body = const SizedBox();
      case NavOption.cart:
        body = const SizedBox();
      case NavOption.user:
        body = const UserSetting();
    }
    return Scaffold(
      body: body,
      floatingActionButton: GradiantIconButton(
        iconData: FontAwesomeIcons.magnifyingGlass,
        size: 60,
        onPressed: () async {
          final jsonString =
              await rootBundle.loadString('assets/response.json');
          final jsonData = jsonDecode(jsonString) as List;
          final products = jsonData.map((e) => Product.fromMap(e)).toList();
          print(products.length);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: const NavOptions(),
      bottomNavigationBar: Material(
        elevation: 10,
        child: BottomAppBar(
          // color: Colors.blue,
          notchMargin: 10.0,
          shape: CircularNotchedRectangle(),
          child: NavOptions(),
        ),
      ),
    );
  }
}

class NavOptions extends ConsumerWidget {
  const NavOptions({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(navProvider.notifier);
    final selectedNav = ref.watch(navProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NavIcon(
          onPress: () => notifier.setOption = NavOption.home,
          iconPath: 'assets/icons/home.svg',
          isSelected: selectedNav == NavOption.home,
          iconSize: 38,
        ),
        NavIcon(
          onPress: () => notifier.setOption = NavOption.settings,
          iconPath: 'assets/icons/grid.svg',
          isSelected: selectedNav == NavOption.settings,
        ),
        const Gap(30),
        NavIcon(
          onPress: () => notifier.setOption = NavOption.cart,
          iconPath: 'assets/icons/cart.svg',
          isSelected: selectedNav == NavOption.cart,
        ),
        NavIcon(
          onPress: () => notifier.setOption = NavOption.user,
          iconPath: 'assets/icons/user_outline.svg',
          isSelected: selectedNav == NavOption.user,
        ),
      ],
    );
  }
}

class NavIcon extends StatelessWidget {
  const NavIcon({
    super.key,
    this.iconPath,
    this.isSelected,
    this.onPress,
    this.iconSize = 30,
  });
  final String? iconPath;
  final bool? isSelected;
  final VoidCallback? onPress;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: SvgPicture.asset(
        iconPath!,
        height: iconSize,
        // ignore: deprecated_member_use
        color: isSelected! ? Colors.pink : Colors.blueGrey,
      ),
    );
  }
}
