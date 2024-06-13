part of '../extensions.dart';

extension UserExt on User {
  bool get isPasswordMatched => password == confirmPassword;


}
