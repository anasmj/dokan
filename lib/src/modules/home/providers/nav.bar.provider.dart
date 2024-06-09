import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NavOption { home, settings, cart, user }

final navProvider =
    NotifierProvider<NavOptionProvider, NavOption>(NavOptionProvider.new);

class NavOptionProvider extends Notifier<NavOption> {
  @override
  NavOption build() => NavOption.home;
  set setOption(NavOption op) => state = op;
}
