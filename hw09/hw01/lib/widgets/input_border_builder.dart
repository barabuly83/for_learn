import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class InputBorderBuilder {
  static InputBorder buildBorder({
    Color? color,
    double? width,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      borderSide: BorderSide(
        color: color ?? Colors.grey.shade300,
        width: width ?? 1,
      ),
    );
  }

  static InputBorder buildDefaultBorder() => buildBorder();

  static InputBorder buildFocusedBorder(BuildContext context) => buildBorder(
        color: Theme.of(context).colorScheme.primary,
        width: 2,
      );

  static InputBorder buildErrorBorder() => buildBorder(
        color: Colors.red,
      );

  static InputBorder buildFocusedErrorBorder() => buildBorder(
        color: Colors.red,
        width: 2,
      );
}

