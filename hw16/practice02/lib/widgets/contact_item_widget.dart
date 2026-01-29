import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactItemWidget extends StatelessWidget {
  final Contact contact;

  const ContactItemWidget({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(contact.name[0]),
      ),
      title: Text(contact.name),
      subtitle: Text('${contact.phone}\n${contact.email}'),
      isThreeLine: true,
    );
  }
}