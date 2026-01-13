import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../viewmodels/contacts_viewmodel.dart';
import '../widgets/contact_card.dart';

class ContactsPage extends StatelessWidget {
  final ContactsViewModel viewModel;

  ContactsPage({
    super.key,
    ContactsViewModel? viewModel,
  }) : viewModel = viewModel ?? ContactsViewModel();

  @override
  Widget build(BuildContext context) {
    final contacts = viewModel.getContacts();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.contactsTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ContactCard(
            contact: contact,
            onTap: () {
              Navigator.pushNamed(
                context,
                AppConstants.contactDetailRoute,
                arguments: contact,
              );
            },
          );
        },
      ),
    );
  }
}