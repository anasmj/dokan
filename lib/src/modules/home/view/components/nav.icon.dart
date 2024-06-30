import 'package:dokan/src/gen/assets.gen.dart';
import 'package:dokan/src/modules/home/providers/nav.bar.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class NavOptions extends ConsumerWidget {
  const NavOptions({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(navProvider.notifier);
    final selectedNav = ref.watch(navProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _NavIcon(
          onPress: () => notifier.setOption = NavOption.home,
          iconPath: Assets.svg.home,
          isSelected: selectedNav == NavOption.home,
          iconSize: 38,
        ),
        _NavIcon(
          onPress: () => notifier.setOption = NavOption.settings,
          iconPath: Assets.svg.grid,
          isSelected: selectedNav == NavOption.settings,
        ),
        const Gap(30),
        _NavIcon(
          onPress: () => notifier.setOption = NavOption.cart,
          iconPath: Assets.svg.cart,
          isSelected: selectedNav == NavOption.cart,
        ),
        _NavIcon(
          onPress: () => notifier.setOption = NavOption.user,
          iconPath: Assets.svg.userOutline,
          isSelected: selectedNav == NavOption.user,
        ),
      ],
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
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
