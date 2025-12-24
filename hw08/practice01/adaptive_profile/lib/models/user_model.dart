class UserModel {
  final String name;
  final String profession;
  final UserStats stats;

  const UserModel({
    required this.name,
    required this.profession,
    required this.stats,
  });
}

class UserStats {
  final String subscribers;
  final String subscriptions;
  final String posts;

  const UserStats({
    required this.subscribers,
    required this.subscriptions,
    required this.posts,
  });
}

