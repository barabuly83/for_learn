import 'package:flutter/material.dart';
import 'input_border_builder.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        border: InputBorderBuilder.buildDefaultBorder(),
        enabledBorder: InputBorderBuilder.buildDefaultBorder(),
        focusedBorder: InputBorderBuilder.buildFocusedBorder(context),
        errorBorder: InputBorderBuilder.buildErrorBorder(),
        focusedErrorBorder: InputBorderBuilder.buildFocusedErrorBorder(),
      ),
      validator: validator,
    );
  }
}

