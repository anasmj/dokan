import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthType { login, signup }

final authTypeProvider =
    NotifierProvider<AuthTypeProvider, AuthType>(AuthTypeProvider.new);

class AuthTypeProvider extends Notifier<AuthType> {
  @override
  AuthType build() => AuthType.login;
  void toggle() {
    state = state == AuthType.login ? AuthType.signup : AuthType.login;
  }
}
