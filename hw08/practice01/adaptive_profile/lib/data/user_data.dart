import '../models/user_model.dart';

class UserData {
  static const UserModel currentUser = UserModel(
    name: 'Иван Иванов',
    profession: 'Разработчик: Flutter',
    stats: UserStats(
      subscribers: '1.2K',
      subscriptions: '356',
      posts: '48',
    ),
  );
}
