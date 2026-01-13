import 'package:flutter/material.dart';
import './constants/app_constants.dart';
import './themes/app_theme.dart';
import './pages/home_page.dart';
import './pages/about_page.dart';
import './pages/contacts_page.dart';
import './pages/contact_detail_page.dart';
import './models/contact.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: HomePage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppConstants.homeRoute:
            return MaterialPageRoute(builder: (_) => HomePage());
          case AppConstants.aboutRoute:
            return MaterialPageRoute(builder: (_) => const AboutPage());
          case AppConstants.contactsRoute:
            return MaterialPageRoute(builder: (_) => ContactsPage());
          case AppConstants.contactDetailRoute:
            final contact = settings.arguments as Contact;
            return MaterialPageRoute(
              builder: (_) => ContactDetailPage(contact: contact),
            );
          default:
            return null;
        }
      },
    );
  }
}