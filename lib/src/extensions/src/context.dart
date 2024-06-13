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

  Future showBottomModal(Widget body) async => showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        context: this,
        builder: (_) => body,
      );
  Future showSnack(String? msg) async => ScaffoldMessenger.of(this)
      .showSnackBar(SnackBar(content: Text(msg ?? '')));
      
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
