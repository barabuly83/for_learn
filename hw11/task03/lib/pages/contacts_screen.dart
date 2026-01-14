import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_constants.dart';
import '../viewmodels/contacts_viewmodel.dart';
import '../widgets/contact_card.dart';

class ContactsScreen extends StatelessWidget {
  final ContactsViewModel viewModel;

  const ContactsScreen({
    super.key,
    ContactsViewModel? viewModel,
  }) : viewModel = viewModel ?? const ContactsViewModel();

  @override
  Widget build(BuildContext context) {
    final contacts = viewModel.getContacts();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.contactsTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ContactCard(
            contact: contact,
            onTap: () {
              context.go('/contact/${contact.id}');
            },
          );
        },
      ),
    );
  }
}