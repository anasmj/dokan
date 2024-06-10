import 'package:dokan/src/extensions/extensions.dart';
import 'package:dokan/src/modules/auth/components/Icon.text.field.dart';
import 'package:dokan/src/modules/auth/components/auth.button.dart';
import 'package:dokan/src/modules/auth/components/auth.options.dart';
import 'package:dokan/src/modules/auth/model/user.dart';
import 'package:dokan/src/modules/auth/provider/auth.type.provider.dart';
import 'package:dokan/src/modules/auth/provider/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SignInBody extends ConsumerWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Gap(200),
        SvgPicture.asset(
          'assets/icons/dokan.svg',
          height: 40,
        ),
        const Gap(80),
        Text(
          'Sign in',
          style: context.text.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(30),
        const IconTextFiled(
          hintText: 'Email',
          prefixIcon: Icons.mail_outline_outlined,
        ),
        const Gap(10),
        const IconTextFiled(
          hintText: 'Password',
          prefixIcon: Icons.lock_outline,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: const Text(
              'Forgot Passord? ',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const Gap(30),
        AuthButton(
          label: 'Login',
          onPressed: () => ref.read(userProvider.notifier).update = User(),
        ),
        const Gap(50),
        const AuthOptoins(),
        Align(
          alignment: Alignment.bottomCenter,
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              // padding: EdgeInsets.symmetric(horizontal: 10),
            ),
            onPressed: ref.read(authTypeProvider.notifier).toggle,
            child: const Text(
              'Create New Account',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        )
      ],
    );
  }
}
