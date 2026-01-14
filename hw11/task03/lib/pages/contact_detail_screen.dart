import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_constants.dart';
import '../viewmodels/contacts_viewmodel.dart';
import '../widgets/info_row.dart';

class ContactDetailScreen extends StatelessWidget {
  final String contactId;
  final ContactsViewModel viewModel;

  const ContactDetailScreen({
    super.key,
    required this.contactId,
    ContactsViewModel? viewModel,
  }) : viewModel = viewModel ?? const ContactsViewModel();

  @override
  Widget build(BuildContext context) {
    final contact = viewModel.getContactById(contactId);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.contactDetailTitle),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go(AppConstants.homeRoute);
          },
        ),
      ),
      body: contact == null
          ? Center(child: Text(AppConstants.contactNotFound))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blue,
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
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
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
                  Card(
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
                            label: AppConstants.emailLabel,
                            value: contact.email,
                          ),
                          const SizedBox(height: 10),
                          InfoRow(
                            icon: Icons.phone,
                            label: AppConstants.phoneLabel,
                            value: contact.phone,
                          ),
                          const SizedBox(height: 10),
                          InfoRow(
                            icon: Icons.badge,
                            label: AppConstants.contactIdLabel,
                            value: '#${contact.id}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      context.go(AppConstants.homeRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(AppConstants.backToContacts),
                  ),
                ],
              ),
            ),
    );
  }
}
