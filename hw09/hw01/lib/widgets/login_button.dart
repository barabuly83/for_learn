import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const LoginButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: AppConstants.buttonPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        backgroundColor: AppConstants.lightPurple,
        elevation: AppConstants.buttonElevation,
      ),
      child: const Text(
        'Войти',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppConstants.darkPurple,
        ),
      ),
    );
  }
}

