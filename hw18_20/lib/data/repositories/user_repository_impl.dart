import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/register.dart';
import '../datasources/user_local_data_source.dart';
import '../datasources/user_remote_data_source.dart';
import '../models/user_model.dart';

/// Реализация репозитория пользователей
/// Координирует работу между удаленным и локальным источниками данных
/// Предоставляет единообразный доступ к данным для доменного слоя
/// Скрывает детали реализации работы с API и локальным хранилищем
class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      // Сначала пытаемся получить данные из кэша
      final cachedUsers = await localDataSource.getCachedUsers();
      if (cachedUsers.isNotEmpty) {
        // Возвращаем кэшированные данные, но также обновляем кэш в фоне
        _refreshUsersCache();
        return Right(
          cachedUsers.map<User>((model) => model.toEntity()).toList(),
        );
      }

      // Если кэша нет, получаем данные из API
      final userModels = await remoteDataSource.getUsers();

      // Сохраняем в кэш для будущего использования
      await localDataSource.cacheUsers(userModels);

      return Right(userModels.map<User>((model) => model.toEntity()).toList());
    } catch (e) {
      // Если API недоступен, пытаемся вернуть данные из кэша
      final cachedUsers = await localDataSource.getCachedUsers();
      if (cachedUsers.isNotEmpty) {
        return Right(
          cachedUsers.map<User>((model) => model.toEntity()).toList(),
        );
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getUserById(String id) async {
    try {
      // Сначала пытаемся получить данные из кэша
      final cachedUser = await localDataSource.getCachedUserById(id);
      if (cachedUser != null) {
        return Right(cachedUser.toEntity());
      }

      // Если кэша нет, получаем данные из API
      final userModel = await remoteDataSource.getUserById(id);

      // Сохраняем в кэш для будущего использования
      await localDataSource.cacheUser(userModel);

      return Right(userModel.toEntity());
    } catch (e) {
      // Если API недоступен, пытаемся вернуть данные из кэша
      final cachedUser = await localDataSource.getCachedUserById(id);
      if (cachedUser != null) {
        return Right(cachedUser.toEntity());
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> createUser(User user) async {
    try {
      final userModel = UserModel.fromEntity(user);

      // Создаем пользователя через API
      final createdUser = await remoteDataSource.createUser(userModel);

      // Сохраняем в кэш
      await localDataSource.cacheUser(createdUser);

      return Right(createdUser.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User user) async {
    try {
      final userModel = UserModel.fromEntity(user);

      // Обновляем пользователя через API
      final updatedUser = await remoteDataSource.updateUser(userModel);

      // Обновляем кэш
      await localDataSource.cacheUser(updatedUser);

      return Right(updatedUser.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserAvatar(String userId, String avatarUrl) async {
    try {
      final userModel = UserModel(
        id: userId,
        name: '', // Эти поля не обновляем
        email: '',
        password: '',
        avatarUrl: avatarUrl,
      );

      await remoteDataSource.updateUser(userModel);
      print('✅ Аватарка пользователя обновлена: $userId');
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(String id) async {
    try {
      // Удаляем пользователя через API
      await remoteDataSource.deleteUser(id);

      // Удаляем из кэша
      await localDataSource.deleteCachedUser(id);

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      // Сохраняем текущего пользователя в кэш
      await localDataSource.cacheCurrentUser(userModel);
      return Right(userModel.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> register(RegisterParams params) async {
    try {
      final registeredUser = await remoteDataSource.register(
        params.name,
        params.email,
        params.password,
      );
      // Сохраняем нового пользователя в кэш
      await localDataSource.cacheCurrentUser(registeredUser);
      return Right(registeredUser.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      // Очищаем кэш текущего пользователя
      await localDataSource.clearCurrentUser();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      // Сначала пытаемся получить данные из кэша
      final cachedUser = await localDataSource.getCachedCurrentUser();
      if (cachedUser != null) {
        return Right(cachedUser.toEntity());
      }

      // Если кэша нет, получаем данные из API
      final userModel = await remoteDataSource.getCurrentUser();
      if (userModel != null) {
        // Сохраняем в кэш
        await localDataSource.cacheCurrentUser(userModel);
        return Right(userModel.toEntity());
      }

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(String email) async {
    try {
      await remoteDataSource.sendPasswordResetEmail(email);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(String currentPassword, String newPassword) async {
    try {
      await remoteDataSource.changePassword(currentPassword, newPassword);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  /// Обновляет кэш пользователей в фоне
  void _refreshUsersCache() async {
    try {
      final userModels = await remoteDataSource.getUsers();
      await localDataSource.cacheUsers(userModels);
    } catch (e) {
      // Игнорируем ошибки при обновлении кэша в фоне
    }
  }
}
