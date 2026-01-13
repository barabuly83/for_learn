import '../models/contact.dart';

class ContactService {
  List<Contact> getContacts() {
    return [
      Contact(
        id: 1,
        name: 'Иван Иванов',
        email: 'ivan@example.com',
        phone: '+7 (123) 456-78-90',
        position: 'Менеджер по продажам',
        avatarColor: 'blue',
      ),
      Contact(
        id: 2,
        name: 'Мария Петрова',
        email: 'maria@example.com',
        phone: '+7 (234) 567-89-01',
        position: 'Дизайнер',
        avatarColor: 'pink',
      ),
      Contact(
        id: 3,
        name: 'Алексей Смирнов',
        email: 'alexey@example.com',
        phone: '+7 (345) 678-90-12',
        position: 'Разработчик',
        avatarColor: 'green',
      ),
      Contact(
        id: 4,
        name: 'Елена Козлова',
        email: 'elena@example.com',
        phone: '+7 (456) 789-01-23',
        position: 'Маркетолог',
        avatarColor: 'purple',
      ),
      Contact(
        id: 5,
        name: 'Дмитрий Волков',
        email: 'dmitry@example.com',
        phone: '+7 (567) 890-12-34',
        position: 'Аналитик',
        avatarColor: 'orange',
      ),
      Contact(
        id: 6,
        name: 'Ольга Новикова',
        email: 'olga@example.com',
        phone: '+7 (678) 901-23-45',
        position: 'Бухгалтер',
        avatarColor: 'teal',
      ),
      Contact(
        id: 7,
        name: 'Сергей Михайлов',
        email: 'sergey@example.com',
        phone: '+7 (789) 012-34-56',
        position: 'Тестировщик',
        avatarColor: 'indigo',
      ),
      Contact(
        id: 8,
        name: 'Анна Соколова',
        email: 'anna@example.com',
        phone: '+7 (890) 123-45-67',
        position: 'HR-менеджер',
        avatarColor: 'red',
      ),
    ];
  }

  Contact? getContactById(int id) {
    return getContacts().firstWhere(
      (contact) => contact.id == id,
      orElse: () => throw Exception('Contact not found'),
    );
  }
}