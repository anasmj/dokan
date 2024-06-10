import 'package:dokan/src/components/gradient.button.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Gap(100),
        const GradientButton(),
        const Gap(50),
        const IconTextFiled(hintText: 'Name', prefixIcon: Icons.person),
        const Gap(20),
        const IconTextFiled(
            hintText: 'Email', prefixIcon: Icons.email_outlined),
        const Gap(20),
        const IconTextFiled(
            hintText: 'Password', prefixIcon: Icons.lock_clock_outlined),
        const Gap(20),
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
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, this.icon, this.onPressed});
  final IconData? icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      elevation: 4,
      child: IconButton(
        color: Colors.grey,
        style: IconButton.styleFrom(backgroundColor: Colors.white),
        onPressed: () {},
        icon: const Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.all(34.0),
              child: Icon(FontAwesomeIcons.user),
            ),
            Positioned(
              bottom: -10,
              right: -10,
              child: GradiantIconButton(
                iconData: Icons.camera_alt,
              ),
            )
          ],
        ),
      ),
    );
  }
}
