import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
  Future<UserModel> getUserById(String id);
  Future<UserModel> createUser(UserModel user);
  Future<UserModel> updateUser(UserModel user);
  Future<void> deleteUser(String id);

  // Authentication methods
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(UserModel user);
  Future<void> logout();
  Future<UserModel?> getCurrentUser();
  Future<void> sendPasswordResetEmail(String email);
}
