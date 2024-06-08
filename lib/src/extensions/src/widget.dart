part of '../extensions.dart';

extension TextFieldExt on TextFormField {
  Widget get decorate => Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: ClipRRect(borderRadius: BorderRadius.circular(10), child: this),
      );
}
