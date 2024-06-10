import 'package:dokan/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import 'bottom.sheet.body.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Filter',
        contentPadding: const EdgeInsets.only(top: 12),
        prefixIcon: const RotatedBox(
          quarterTurns: 3,
          child: Icon(
            FontAwesomeIcons.sliders,
            size: 18,
            color: Colors.grey,
          ),
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Sort By'),
            const Gap(8),
            IconButton(
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () async =>
                  context.showBottomModal(const ProductFilterOptionWidget(),),
              icon: const Icon(Icons.keyboard_arrow_down),
            ),
            const Icon(
              FontAwesomeIcons.list,
              size: 18,
            ),
            const Gap(8)
          ],
        ),
      ),
    ).decorate;
  }
}
