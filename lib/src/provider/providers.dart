import 'package:flutter_riverpod/flutter_riverpod.dart';

final boolProvider =
    NotifierProviderFamily<BoolProvider, bool, String>(BoolProvider.new);

class BoolProvider extends FamilyNotifier<bool, String> {
  @override
  bool build(String arg) => false;
  void toggle() => state = !state;
}
