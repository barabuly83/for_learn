import '../models/contact.dart';

class ContactService {
  const ContactService();

  List<Contact> getContacts() {
    return [
      Contact(
        id: '1',
        name: 'Александр Иванов',
        email: 'alex.ivanov@example.com',
        phone: '+7 (999) 123-45-67',
        position: 'Senior Flutter Developer',
      ),
      Contact(
        id: '2',
        name: 'Мария Петрова',
        email: 'maria.petrova@example.com',
        phone: '+7 (999) 234-56-78',
        position: 'UI/UX Designer',
      ),
      Contact(
        id: '3',
        name: 'Дмитрий Сидоров',
        email: 'dmitry.sidorov@example.com',
        phone: '+7 (999) 345-67-89',
        position: 'Project Manager',
      ),
      Contact(
        id: '4',
        name: 'Елена Кузнецова',
        email: 'elena.kuznetsova@example.com',
        phone: '+7 (999) 456-78-90',
        position: 'Backend Developer',
      ),
      Contact(
        id: '5',
        name: 'Иван Смирнов',
        email: 'ivan.smirnov@example.com',
        phone: '+7 (999) 567-89-01',
        position: 'QA Engineer',
      ),
      Contact(
        id: '6',
        name: 'Ольга Васильева',
        email: 'olga.vasilyeva@example.com',
        phone: '+7 (999) 678-90-12',
        position: 'DevOps Engineer',
      ),
      Contact(
        id: '7',
        name: 'Сергей Попов',
        email: 'sergey.popov@example.com',
        phone: '+7 (999) 789-01-23',
        position: 'Mobile Team Lead',
      ),
      Contact(
        id: '8',
        name: 'Анна Федорова',
        email: 'anna.fedorova@example.com',
        phone: '+7 (999) 890-12-34',
        position: 'Product Owner',
      ),
    ];
  }
}
