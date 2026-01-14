import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_constants.dart';
import '../pages/contacts_screen.dart';
import '../pages/contact_detail_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppConstants.homeRoute,
      name: 'home',
      builder: (context, state) => ContactsScreen(),
    ),
    GoRoute(
      path: AppConstants.contactDetailRoute,
      name: 'contact_detail',
      builder: (context, state) {
        final contactId = state.pathParameters['id']!;
        return ContactDetailScreen(contactId: contactId);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text(AppConstants.pageNotFound)),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 20),
          Text(
            AppConstants.pageNotFound,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),
          Text(
            'Путь: ${state.uri}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go(AppConstants.homeRoute),
            child: const Text(AppConstants.returnToHome),
          ),
        ],
      ),
    ),
  ),
);
