import 'package:dokan/src/modules/auth/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider =
    NotifierProvider<UserProvider, User?>(UserProvider.new);

class UserProvider extends Notifier<User?> {
  @override
  User? build() => null;
  set update(User? user) => state = user;
}
