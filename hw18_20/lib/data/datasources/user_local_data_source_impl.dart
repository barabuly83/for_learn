import 'user_local_data_source.dart';
import '../models/user_model.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  // Mock implementation using in-memory storage
  // In real app, this would use SharedPreferences, Hive, SQLite, etc.

  final List<UserModel> _cachedUsers = [];
  UserModel? _currentUser;

  @override
  Future<List<UserModel>> getCachedUsers() async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    return _cachedUsers;
  }

  @override
  Future<void> cacheUsers(List<UserModel> users) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    _cachedUsers.clear();
    _cachedUsers.addAll(users);
  }

  @override
  Future<UserModel?> getCachedUserById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    return _cachedUsers.cast<UserModel?>().firstWhere(
      (user) => user?.id == id,
      orElse: () => null,
    );
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    final existingIndex = _cachedUsers.indexWhere((u) => u.id == user.id);
    if (existingIndex >= 0) {
      _cachedUsers[existingIndex] = user;
    } else {
      _cachedUsers.add(user);
    }
  }

  @override
  Future<void> deleteCachedUser(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    _cachedUsers.removeWhere((user) => user.id == id);
  }

  @override
  Future<UserModel?> getCachedCurrentUser() async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    return _currentUser;
  }

  @override
  Future<void> cacheCurrentUser(UserModel user) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    _currentUser = user;
  }

  @override
  Future<void> clearCurrentUser() async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    _currentUser = null;
  }

  @override
  Future<void> clearCache() async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    _cachedUsers.clear();
    _currentUser = null;
  }
}
