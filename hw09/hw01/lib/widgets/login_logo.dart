import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class LoginLogo extends StatelessWidget {
  final VoidCallback? onTap;

  const LoginLogo({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: AppConstants.logoSize,
        height: AppConstants.logoSize,
        child: ClipOval(
          child: Container(
            width: AppConstants.logoSize,
            height: AppConstants.logoSize,
            decoration: const BoxDecoration(
              color: AppConstants.lightBlue,
            ),
            child: const Center(
              child: Icon(
                Icons.lock,
                size: AppConstants.iconSize,
                color: AppConstants.darkBlue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

