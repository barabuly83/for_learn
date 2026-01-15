import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'info_row.dart';

class InfoCard extends StatelessWidget {
  final String email;
  final String phone;
  final int id;

  const InfoCard({
    super.key,
    required this.email,
    required this.phone,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppConstants.contactInfoTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            InfoRow(
              icon: Icons.email,
              label: 'Email',
              value: email,
            ),
            const SizedBox(height: 10),
            InfoRow(
              icon: Icons.phone,
              label: 'Телефон',
              value: phone,
            ),
            const SizedBox(height: 10),
            InfoRow(
              icon: Icons.badge,
              label: 'ID контакта',
              value: '#$id',
            ),
          ],
        ),
      ),
    );
  }
}