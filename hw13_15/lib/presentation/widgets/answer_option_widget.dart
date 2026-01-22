import 'package:flutter/material.dart';

class AnswerOptionWidget extends StatelessWidget {
  final String answerKey;
  final String answerText;
  final bool isSelected;
  final bool isMultiple;
  final VoidCallback onTap;

  const AnswerOptionWidget({
    super.key,
    required this.answerKey,
    required this.answerText,
    required this.isSelected,
    required this.isMultiple,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? Colors.blue.withValues(alpha: 0.1) : null,
          ),
          child: Row(
            children: [
              Checkbox(
                value: isSelected,
                onChanged: (_) => onTap(),
                shape: isMultiple ? null : const CircleBorder(),
                side: isMultiple ? null : const BorderSide(width: 2),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  answerText,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}