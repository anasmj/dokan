import 'package:dokan/src/modules/auth/provider/user.provider.dart';
import 'package:dokan/src/modules/home/view/app.home.dart';
import 'package:dokan/src/theme/light.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/modules/auth/view/auth.wrapper.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const DokanApp(),
      ),
    );
  }
}

class DokanApp extends ConsumerWidget {
  const DokanApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final curentUser = ref.watch(userProvider);
    return curentUser != null ? const AppHome() : const AuthenticatePage();
  }
}
