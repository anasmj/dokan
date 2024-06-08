import 'package:dokan/src/modules/auth/components/sign.body.dart';
import 'package:dokan/src/modules/auth/components/sign.up.body.dart';
import 'package:dokan/src/modules/auth/provider/auth.type.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticatePage extends ConsumerWidget {
  const AuthenticatePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isLoginSelected = ref.watch(authTypeProvider) == AuthType.login;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8),
      child: isLoginSelected ? const SignInBody() : const SignUpBody(),
    ));
  }
}
