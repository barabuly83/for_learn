import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/contact.dart';
import '../widgets/info_card.dart';
import '../widgets/additional_info_card.dart';
import '../utils/color_utils.dart';

class ContactDetailPage extends StatelessWidget {
  final Contact contact;

  const ContactDetailPage({super.key, required this.contact});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.contactDetailTitle),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: ColorUtils.getAvatarColor(contact.avatarColor),
              child: Text(
                contact.name.split(' ').map((n) => n[0]).join(),
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              contact.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              contact.position,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            InfoCard(
              email: contact.email,
              phone: contact.phone,
              id: contact.id,
            ),
            const SizedBox(height: 20),
            const AdditionalInfoCard(),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: const Text(AppConstants.backToContactsText),
            ),
          ],
        ),
      ),
    );
  }
}
