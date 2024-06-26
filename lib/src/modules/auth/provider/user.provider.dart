import 'dart:io';

import 'package:dokan/src/modules/auth/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = NotifierProvider<UserProvider, User?>(UserProvider.new);

class UserProvider extends Notifier<User?> {
  @override
  User? build() => null;

  set update(User? user) => state = user;

  onNameChange(String? s) => state = state?.copyWith(userName: s);
  onEmailChange(String? s) => state = state?.copyWith(email: s);
  onPassChange(String? s) => state = state?.copyWith(password: s);
  onConfirmPassChange(String? s) => state = state?.copyWith(confirmPassword: s);
  updateImage(File f) => state = state?.copyWith(image: f);
}
