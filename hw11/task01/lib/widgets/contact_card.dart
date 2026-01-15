import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../utils/color_utils.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;

  const ContactCard({super.key, required this.contact, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: ColorUtils.getAvatarColor(contact.avatarColor),
          child: Text(
            contact.name.split(' ').map((n) => n[0]).join(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          contact.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(contact.position),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
