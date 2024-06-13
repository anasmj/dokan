import 'package:dokan/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

final _accountTileController = ExpansionTileController();

class AccountTile extends StatelessWidget {
  const AccountTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controller: _accountTileController,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      leading: const Icon(FontAwesomeIcons.user),
      title: const Text('Account'),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        const Text('Email'),
        const Gap(10),
        TextFormField(decoration: decoration(hintText: 'youremail@xmail.com')),
        const Gap(10),
        const Text('Full Name'),
        const Gap(10),
        TextFormField(decoration: decoration(hintText: 'William Benette')),
        const Gap(10),
        const Text('Street Address'),
        const Gap(10),
        TextFormField(
          decoration: decoration(hintText: '465 Nolan Causeway Suite 079'),
        ),
        const Gap(10),
        const Text('Apt, Suite, Bldg (optional)'),
        const Gap(10),
        TextFormField(
          decoration: decoration(hintText: 'Unit 512'),
        ),
        const Gap(10),
        const Text('Zip Code'),
        const Gap(10),
        TextFormField(
          decoration: decoration(hintText: '2515'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // maximumSize: const Size.fromHeight(30),
                ),
                onPressed: () => _accountTileController.collapse(),
                child: const Text('Cancel'),
              ),
              FilledButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => context.showSnack('Can not update user'),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InputDecoration decoration({String? hintText}) => InputDecoration(
        // hintText: 'youremail@xmail.com',
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
      );
}
