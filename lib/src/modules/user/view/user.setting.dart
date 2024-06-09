import 'package:dokan/src/extensions/extensions.dart';
import 'package:dokan/src/modules/user/view/components/account.tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class UserSetting extends StatelessWidget {
  const UserSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(80),
              Text('My Account', style: context.text.titleLarge),
              const Gap(30),
              const CircleAvatar(radius: 56),
              const Gap(30),
              Text(
                'Jhon Smith',
                style: context.text.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('example@gmail.com'),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    // height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      children: [
                        AccountTile(),
                        ExpansionTile(
                          leading: Icon(Icons.lock_outline_sharp),
                          title: Text('Password'),
                        ),
                        ExpansionTile(
                          leading: Icon(FontAwesomeIcons.bell),
                          title: Text('Notification'),
                        ),
                        ExpansionTile(
                          leading: Icon(Icons.favorite_border),
                          title: Text('Wishlist'),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
