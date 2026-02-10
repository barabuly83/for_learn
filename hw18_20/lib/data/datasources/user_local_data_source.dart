import '../models/user_model.dart';

/// Абстракция для локального источника данных пользователей (Hive Storage)
/// Скрывает детали реализации работы с локальным хранилищем
/// В реальном приложении здесь мог бы быть Hive, SharedPreferences, SQLite и т.д.
abstract class UserLocalDataSource {
  Future<List<UserModel>> getCachedUsers();
  Future<void> cacheUsers(List<UserModel> users);
  Future<UserModel?> getCachedUserById(String id);
  Future<void> cacheUser(UserModel user);
  Future<void> deleteCachedUser(String id);

  // Current user methods
  Future<UserModel?> getCachedCurrentUser();
  Future<void> cacheCurrentUser(UserModel user);
  Future<void> clearCurrentUser();

  Future<void> clearCache();
}
