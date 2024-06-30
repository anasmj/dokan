import 'package:dokan/src/gen/assets.gen.dart';
import 'package:dokan/src/components/gradient.button.dart';
import 'package:dokan/src/extensions/extensions.dart';
import 'package:dokan/src/modules/home/providers/nav.bar.provider.dart';
import 'package:dokan/src/modules/home/view/components/product.list.dart';
import 'package:dokan/src/modules/user/view/user.setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import 'components/nav.icon.dart';

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
        body = const NoImplementationWidget(title: 'Settings');
      case NavOption.cart:
        body = const NoImplementationWidget(title: 'Cart');
      case NavOption.user:
        body = const UserSetting();
    }
    return Scaffold(
      body: body,
      floatingActionButton: GradiantIconButton(
        iconData: FontAwesomeIcons.magnifyingGlass,
        size: 60,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const Material(
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

class NoImplementationWidget extends StatelessWidget {
  const NoImplementationWidget({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title ?? '',
          style: context.text.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.svg.undraw,
              height: 200,
            ),
            const Gap(60),
            Text(
              'Not Implementated',
              style: context.text.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
