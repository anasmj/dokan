import 'package:dokan/src/gen/assets.gen.dart';
import 'package:dokan/src/components/gradient.button.dart';
import 'package:dokan/src/extensions/extensions.dart';
import 'package:dokan/src/modules/auth/components/Icon.text.field.dart';
import 'package:dokan/src/modules/auth/components/auth.button.dart';
import 'package:dokan/src/modules/auth/components/auth.options.dart';
import 'package:dokan/src/modules/auth/provider/auth.type.provider.dart';
import 'package:dokan/src/modules/auth/provider/file.provider.dart';
import 'package:dokan/src/modules/auth/provider/new.user.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

final _formKey = GlobalKey<FormState>();

class SignUpBody extends ConsumerWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(newUserProvider.notifier);
    final user = ref.watch(newUserProvider);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(100),
          const ProfileButton(),
          const Gap(50),
          IconTextFiled(
            hintText: 'Name',
            prefixIcon: Icons.person,
            onChanged: notifier.onNameChange,
            validator: (v) => v!.isNotEmpty ? null : 'Choose a username',
          ),
          const Gap(20),
          IconTextFiled(
            hintText: 'Email',
            prefixIcon: Icons.email_outlined,
            textInputType: TextInputType.emailAddress,
            onChanged: notifier.onEmailChange,
            validator: (v) => v.isValidEmail ? null : 'Invalid Email',
          ),
          const Gap(20),
          IconTextFiled(
            hintText: 'Password',
            prefixIcon: Icons.lock_clock_outlined,
            onChanged: notifier.onPassChange,
            validator: (v) => v!.isNotEmpty ? null : 'Choose a password',
          ),
          const Gap(20),
          IconTextFiled(
            hintText: 'Confirm Password',
            prefixIcon: Icons.lock_clock_outlined,
            onChanged: notifier.onConfirmPassChange,
            validator: (v) =>
                user!.isPasswordMatched ? null : 'Password did not match',
          ),
          const Gap(40),
          AuthButton(
            label: 'Sign up',
            onPressed: () async {
              if (!_formKey.currentState!.validate()) return;
              final msg = await notifier.register();
              if (!context.mounted) return;
              if (msg != null) {
                context.showSnack(msg);
              } else {
                context.showSnack('Registration Successful');
              }
            },
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

class ProfileButton extends ConsumerWidget {
  const ProfileButton({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final selectedFile = ref.watch(fileProvider('create'));
    final notifier = ref.watch(fileProvider('create').notifier);
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      elevation: 4,
      child: IconButton.filled(
        color: Colors.grey,
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
        ),
        onPressed: notifier.pickFile,
        icon: Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: selectedFile != null
                  ? Image.file(selectedFile, fit: BoxFit.cover).image
                  : null,
              child: selectedFile == null
                  ? SvgPicture.asset(
                      Assets.svg.userOutline,
                      height: 40,
                    )
                  : null,
            ),
            Positioned(
              bottom: -2,
              right: -2,
              child: GradiantIconButton(
                  iconData:
                      selectedFile == null ? Icons.camera_alt : Icons.remove,
                  onPressed: () {
                    if (selectedFile != null) {
                      notifier.removeImage();
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
