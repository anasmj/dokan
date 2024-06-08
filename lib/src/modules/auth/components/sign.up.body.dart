import 'package:dokan/src/modules/auth/components/Icon.text.field.dart';
import 'package:dokan/src/modules/auth/components/auth.button.dart';
import 'package:dokan/src/modules/auth/components/auth.options.dart';
import 'package:dokan/src/modules/auth/provider/auth.type.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpBody extends ConsumerWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Gap(30),
          const _ProfilePicture(),
          const Gap(30),
          const IconTextFiled(hintText: 'Name', prefixIcon: Icons.person),
          const Gap(10),
          const IconTextFiled(
              hintText: 'Email', prefixIcon: Icons.email_outlined),
          const Gap(10),
          const IconTextFiled(
              hintText: 'Password', prefixIcon: Icons.lock_clock_outlined),
          const Gap(10),
          const IconTextFiled(
              hintText: 'Confirm Password',
              prefixIcon: Icons.lock_clock_outlined),
          const Gap(40),
          AuthButton(
            label: 'Sign up',
            onPressed: () {},
          ),
          const Gap(30),
          const AuthOptoins(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                onPressed: ref.read(authTypeProvider.notifier).toggle,
                child: const Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 4,
      child: IconButton.filled(
        color: Colors.grey,
        style: IconButton.styleFrom(backgroundColor: Colors.white),
        onPressed: () {},
        icon: Stack(
          clipBehavior: Clip.none,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(FontAwesomeIcons.user),
              // child: const Icon(Icons.person_outline),
            ),
            Positioned(
              bottom: -10,
              right: -10,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.deepOrangeAccent,
                      Colors.red,
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
      
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     String jsonString =
        //         await rootBundle.loadString('assets/response.json');
        //     final jsonData = jsonDecode(jsonString) as List;
        //     final productList = jsonData.map((e) => Product.fromMap(e)).toList();
        //     for (var p in productList) {
        //       if (p.images != null && p.images!.isNotEmpty) {
        //         for (var i in p.images!) {
        //           print('url: $i');
        //         }
        //       }
        //     }
        //     print('image ${productList.first.images?.first}');
        //   },
        // ),