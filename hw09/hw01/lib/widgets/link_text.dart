import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class LinkText extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? color;
  final Alignment alignment;

  const LinkText({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.linkBorderRadius),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: color ?? Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

