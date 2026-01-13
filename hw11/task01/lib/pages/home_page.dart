import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/app_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppConstants.welcomeText,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            AppButton(
              text: AppConstants.aboutButtonText,
              icon: Icons.info_outline,
              onPressed: () {
                Navigator.pushNamed(context, AppConstants.aboutRoute);
              },
            ),
            const SizedBox(height: 20),
            AppButton(
              text: AppConstants.contactsButtonText,
              icon: Icons.contacts,
              onPressed: () {
                Navigator.pushNamed(context, AppConstants.contactsRoute);
              },
            ),
            const SizedBox(height: 40),
            const Text(
              AppConstants.navigationHint,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}