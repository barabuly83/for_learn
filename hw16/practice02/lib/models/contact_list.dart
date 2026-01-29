import 'contact.dart';

class ContactList {
  final List<Contact> contacts;

  const ContactList(this.contacts);

  ContactList.empty() : contacts = const [];
}
