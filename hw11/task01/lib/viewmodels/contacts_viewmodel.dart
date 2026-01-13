import '../models/contact.dart';
import '../services/contact_service.dart';

class ContactsViewModel {
  final ContactService _contactService;

  ContactsViewModel({ContactService? contactService})
      : _contactService = contactService ?? ContactService();

  List<Contact> getContacts() {
    return _contactService.getContacts();
  }

  Contact getContactById(int id) {
    final contact = _contactService.getContactById(id);
    if (contact == null) {
      throw Exception('Contact with id $id not found');
    }
    return contact;
  }
}