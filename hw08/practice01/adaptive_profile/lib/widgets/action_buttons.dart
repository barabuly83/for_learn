import 'package:flutter/material.dart';
import 'action_button.dart';
import '../utils/constants.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(
          text: 'Редактировать',
          backgroundColor: AppColors.buttonBackground,
        ),
        ActionButton(
          text: 'Поделиться',
          backgroundColor: AppColors.white,
        ),
      ],
    );
  }
}
