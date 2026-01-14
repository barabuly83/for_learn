import '../models/contact.dart';
import '../services/contact_service.dart';

class ContactsViewModel {
  final ContactService _contactService;

  const ContactsViewModel({ContactService? contactService})
    : _contactService = contactService ?? const ContactService();

  List<Contact> getContacts() => _contactService.getContacts();

  Contact? getContactById(String id) {
    try {
      return _contactService.getContacts().firstWhere(
        (contact) => contact.id == id,
      );
    } catch (e) {
      return null;
    }
  }
}
