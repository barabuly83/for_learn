import 'package:flutter/material.dart';
import '../models/contact_list.dart';
import 'contact_item_widget.dart';

class ContactListWidget extends StatelessWidget {
  final ContactList contactList;

  const ContactListWidget({
    super.key,
    required this.contactList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactList.contacts.length,
      itemBuilder: (context, index) {
        return ContactItemWidget(contact: contactList.contacts[index]);
      },
    );
  }
}