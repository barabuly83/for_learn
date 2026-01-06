import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

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

  InputBorder _buildBorder(BuildContext context, {Color? color, double? width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      borderSide: BorderSide(
        color: color ?? Colors.grey.shade300,
        width: width ?? 1,
      ),
    );
  }

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
        border: _buildBorder(context),
        enabledBorder: _buildBorder(context),
        focusedBorder: _buildBorder(
          context,
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
        errorBorder: _buildBorder(context, color: Colors.red),
        focusedErrorBorder: _buildBorder(
          context,
          color: Colors.red,
          width: 2,
        ),
      ),
      validator: validator,
    );
  }
}

