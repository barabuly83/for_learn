import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/feature_item.dart';
import '../widgets/tech_item.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.aboutTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Icon(Icons.info, size: 80, color: Colors.blue)),
            const SizedBox(height: 20),
            Text(
              AppConstants.aboutAppTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              AppConstants.aboutDescription,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),
            Text(
              AppConstants.featuresTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const FeatureItem(text: 'Навигация между экранами'),
            const FeatureItem(text: 'Передача данных между экранами'),
            const FeatureItem(text: 'Список контактов с детальной информацией'),
            const FeatureItem(text: 'Использование лучших практик Flutter'),
            const SizedBox(height: 20),
            Text(
              AppConstants.technologiesTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const TechItem(text: 'Flutter 3.0+'),
            const TechItem(text: 'Dart 3.0+'),
            const TechItem(text: 'Material Design 3'),
            const SizedBox(height: 20),
            Text(
              'Приложение создано в рамках учебного задания по изучению навигации в Flutter.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(AppConstants.backButtonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
