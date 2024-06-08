part of '../extensions.dart';

extension ContextExt on BuildContext {
  TextTheme get text => Theme.of(this).textTheme;
  push(Widget page) => Navigator.push(
        this,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: page,
          ),
        ),
      );
}
