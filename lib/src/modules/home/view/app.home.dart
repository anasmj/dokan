import 'package:dokan/src/components/gradient.button.dart';
import 'package:dokan/src/modules/home/providers/nav.bar.provider.dart';
import 'package:dokan/src/modules/home/view/components/product.list.dart';
import 'package:dokan/src/modules/user/view/user.setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          // final jsonString =
          //     await rootBundle.loadString('assets/response.json');
          // final jsonData = jsonDecode(jsonString) as List;
          // final products = jsonData.map((e) => Product.fromMap(e)).toList();
          // for (var p in products) {
          //   print(p.images?.first?.src);
          // }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavOptions(),
    );
  }
}

class NavOptions extends ConsumerWidget {
  const NavOptions({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(navProvider.notifier);
    final selectedNav = ref.watch(navProvider);
    final Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomPaint(
          size: Size(size.width, 80),
          painter: BNBCustomPainter(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => notifier.setOption = NavOption.home,
                icon: Icon(
                  FontAwesomeIcons.house,
                  color: selectedNav == NavOption.home ? Colors.pink : null,
                ),
              ),
              IconButton(
                onPressed: () => notifier.setOption = NavOption.settings,
                icon: Icon(
                  FontAwesomeIcons.stethoscope,
                  color: selectedNav == NavOption.settings ? Colors.pink : null,
                ),
              ),
              const Gap(30),
              IconButton(
                onPressed: () => notifier.setOption = NavOption.cart,
                icon: Icon(
                  FontAwesomeIcons.cartShopping,
                  color: selectedNav == NavOption.cart ? Colors.pink : null,
                ),
              ),
              IconButton(
                onPressed: () => notifier.setOption = NavOption.user,
                icon: Icon(
                  FontAwesomeIcons.user,
                  color: selectedNav == NavOption.user ? Colors.pink : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
