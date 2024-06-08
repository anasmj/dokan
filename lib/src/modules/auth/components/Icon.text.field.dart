import 'package:dokan/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class IconTextFiled extends StatelessWidget {
  const IconTextFiled({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
  });
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? hintText;
  final Function(String? s)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(size: 16, prefixIcon, color: Colors.grey)
            : null,
        suffixIcon: prefixIcon != null
            ? Icon(size: 16, suffixIcon, color: Colors.grey)
            : null,
      ),
    ).decorate;
  }
}
