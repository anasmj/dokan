import 'package:dokan/src/gen/assets.gen.dart';
import 'package:dokan/src/extensions/extensions.dart';
import 'package:dokan/src/modules/auth/provider/file.provider.dart';
import 'package:dokan/src/modules/user/view/components/account.tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class UserSetting extends ConsumerWidget {
  const UserSetting({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final image = ref.watch(fileProvider('update'));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Account',
          style: context.text.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  onTap: ref.read(fileProvider('update').notifier).pickFile,
                  splashColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: image != null
                        ? Image.file(image, fit: BoxFit.cover).image
                        : null,
                    child: image == null
                        ? SvgPicture.asset(
                            Assets.svg.userOutline,
                            height: 40,
                          )
                        : null,
                  ),
                ),
              ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
