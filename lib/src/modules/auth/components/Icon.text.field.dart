import 'package:dokan/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class IconTextFiled extends StatelessWidget {
  const IconTextFiled({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.suffix,
    this.onChanged,
    this.textInputType,
    this.validator,
  });
  final IconData? prefixIcon;
  final Widget? suffix;
  final String? hintText;
  final Function(String? s)? onChanged;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      keyboardType: textInputType,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(size: 16, prefixIcon, color: Colors.grey)
            : null,
        suffixIcon: prefixIcon != null ? suffix : null,
      ),
    ).decorate;
  }
}
