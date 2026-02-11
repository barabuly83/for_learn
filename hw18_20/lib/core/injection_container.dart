import 'package:get_it/get_it.dart';

import 'avatar_service.dart';
import 'firebase_storage_service.dart';
import '../data/datasources/auth_remote_data_source.dart';
import '../data/datasources/auth_remote_data_source_impl.dart';
import '../data/datasources/todo_local_data_source.dart';
import '../data/datasources/todo_local_data_source_impl.dart';
import '../data/datasources/todo_remote_data_source.dart';
import '../data/datasources/todo_remote_data_source_impl.dart';
import '../data/datasources/user_local_data_source.dart';
import '../data/datasources/user_local_data_source_impl.dart';
import '../data/datasources/user_remote_data_source.dart';
import '../data/datasources/user_remote_data_source_impl.dart';
import '../data/repositories/todo_repository_impl.dart';
import '../data/repositories/user_repository_impl.dart';
import '../domain/repositories/todo_repository.dart';
import '../domain/repositories/user_repository.dart';
import '../domain/usecases/create_todo.dart';
import '../domain/usecases/delete_todo.dart';
import '../domain/usecases/get_current_user.dart';
import '../domain/usecases/get_todos.dart';
import '../domain/usecases/toggle_todo_complete.dart';
import '../domain/usecases/update_todo.dart';
import '../domain/usecases/get_users.dart';
import '../domain/usecases/login.dart';
import '../domain/usecases/logout.dart';
import '../domain/usecases/change_password.dart';
import '../domain/usecases/register.dart';
import '../domain/usecases/reset_password.dart';
import '../domain/usecases/update_user_avatar.dart';
import '../presentation/bloc/auth_bloc.dart';
import '../presentation/bloc/login_form_cubit.dart';
import '../presentation/bloc/register_form_cubit.dart';
import '../presentation/bloc/todo_bloc.dart';
import '../presentation/bloc/user_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core services
  sl.registerLazySingleton<FirebaseStorageService>(
    () => FirebaseStorageService(),
  );

  sl.registerLazySingleton<AvatarService>(
    () => AvatarService(sl<FirebaseStorageService>()),
  );

  // Data layer - Auth
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  // Data layer - User
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(authRemoteDataSource: sl()),
  );

  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<TodoLocalDataSource>(
    () => TodoLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<TodoRemoteDataSource>(
    () => TodoRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );

  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );

  // Domain layer
  sl.registerLazySingleton(() => GetUsers(sl()));
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Register(sl()));
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => ResetPassword(sl()));
  sl.registerLazySingleton(() => ChangePassword(sl()));
  sl.registerLazySingleton(() => UpdateUserAvatar(sl()));
  sl.registerLazySingleton(() => GetTodos(sl()));
  sl.registerLazySingleton(() => CreateTodo(sl()));
  sl.registerLazySingleton(() => ToggleTodoComplete(sl()));
  sl.registerLazySingleton(() => DeleteTodo(sl()));
  sl.registerLazySingleton(() => UpdateTodo(sl()));

  // Presentation layer
  sl.registerFactory(() => UserBloc(getUsers: sl()));
  sl.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      login: sl(),
      register: sl(),
      getCurrentUser: sl(),
      logout: sl(),
      resetPassword: sl(),
      changePassword: sl(),
      updateUserAvatar: sl(),
    ),
  );
  sl.registerFactory(
    () => TodoBloc(
      createTodo: sl(),
      getTodos: sl(),
      toggleTodoComplete: sl(),
      deleteTodo: sl(),
      updateTodo: sl(),
      authBloc: sl<AuthBloc>(),
    ),
  );

  // Form Cubits
  sl.registerFactory(() => LoginFormCubit(sl<Login>()));
  sl.registerFactory(() => RegisterFormCubit(sl<Register>()));
}
