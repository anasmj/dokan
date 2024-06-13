part of '../extensions.dart';

extension StrExt on String? {
  bool get isValidEmail {
    if (this == null) return false;
    return emailRegExp.hasMatch(this!);
  }
}
