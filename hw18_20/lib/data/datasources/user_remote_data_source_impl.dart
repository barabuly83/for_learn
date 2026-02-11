import 'auth_remote_data_source.dart';
import 'user_remote_data_source.dart';
import '../models/user_model.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  // This is a mock implementation. In a real app, you would use http package
  // to make actual API calls to a backend service.

  @override
  Future<List<UserModel>> getUsers() async {
    // Simulate API delay
    await Future<void>.delayed(const Duration(seconds: 1));

    // Mock data
    return [
      const UserModel(
        id: '1',
        name: 'John Doe',
        email: 'john@example.com',
        password: '',
      ),
      const UserModel(
        id: '2',
        name: 'Jane Smith',
        email: 'jane@example.com',
        password: '',
      ),
      const UserModel(
        id: '3',
        name: 'Bob Johnson',
        email: 'bob@example.com',
        password: '',
      ),
    ];
  }

  @override
  Future<UserModel> getUserById(String id) async {
    // Simulate API delay
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // Mock data - in real app, this would be an API call
    return const UserModel(
      id: '1',
      name: 'John Doe',
      email: 'john@example.com',
      password: '',
    );
  }

  @override
  Future<UserModel> createUser(UserModel user) async {
    // Simulate API delay
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // Mock implementation - in real app, this would send data to API
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
      createdAt: user.createdAt,
    );
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    // Simulate API delay
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // Mock implementation - in real app, this would update data via API
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
      createdAt: user.createdAt,
    );
  }

  @override
  Future<void> deleteUser(String id) async {
    // Simulate API delay
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // Mock implementation - in real app, this would delete data via API
  }

  UserRemoteDataSourceImpl({required this.authRemoteDataSource});

  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<UserModel> login(String email, String password) async {
    // Используем AuthRemoteDataSource для аутентификации через Firebase
    return await authRemoteDataSource.signInWithEmailAndPassword(
      email,
      password,
    );
  }

  @override
  Future<UserModel> register(String name, String email, String password) async {
    // Используем AuthRemoteDataSource для регистрации через Firebase
    return await authRemoteDataSource.signUpWithEmailAndPassword(
      email,
      password,
      name,
    );
  }

  @override
  Future<void> logout() async {
    // Используем AuthRemoteDataSource для выхода через Firebase
    await authRemoteDataSource.signOut();
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    // Используем AuthRemoteDataSource для получения текущего пользователя из Firebase
    return await authRemoteDataSource.getCurrentUser();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    // Используем AuthRemoteDataSource для отправки email восстановления пароля через Firebase
    await authRemoteDataSource.sendPasswordResetEmail(email);
  }

  @override
  Future<void> changePassword(String currentPassword, String newPassword) async {
    // Используем AuthRemoteDataSource для изменения пароля через Firebase
    await authRemoteDataSource.changePassword(currentPassword, newPassword);
  }
}
