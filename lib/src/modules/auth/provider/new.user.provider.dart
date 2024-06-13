import 'dart:io';

import 'package:dokan/src/api/wp.api.dart';
import 'package:dokan/src/modules/auth/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newUserProvider =
    NotifierProvider<NewUserProvider, User?>(NewUserProvider.new);

class NewUserProvider extends Notifier<User?> {
  @override
  User? build() {
    return null;
    // return User(
    //   userName: 'anas.azmi',
    //   password: 'anas1234',
    //   email: 'anasmj7@gmail.com',
    // );
  }

  set update(User? user) => state = user;

  onNameChange(String? s) => state = state?.copyWith(userName: s);
  onEmailChange(String? s) => state = state?.copyWith(email: s);
  onPassChange(String? s) => state = state?.copyWith(password: s);
  onConfirmPassChange(String? s) => state = state?.copyWith(confirmPassword: s);
  updateImage(File f) => state = state?.copyWith(image: f);

  Future<String?> register() async => await WordpressApi.register(state!);
}
