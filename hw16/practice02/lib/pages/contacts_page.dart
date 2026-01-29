import 'package:flutter/material.dart';
import '../models/contact_list.dart';
import '../widgets/contact_list_widget.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactList contactList = ContactList.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ContactListWidget(contactList: contactList),
    );
  }
}