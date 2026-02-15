import 'package:get_it/get_it.dart';

import 'avatar_service.dart';
import '../data/datasources/todo_remote_data_source.dart';
import '../data/datasources/todo_remote_data_source_impl.dart';
import '../data/repositories/todo_repository_impl.dart';
import '../domain/repositories/todo_repository.dart';
import '../presentation/bloc/auth_bloc.dart';
import '../presentation/bloc/login_form_cubit.dart';
import '../presentation/bloc/register_form_cubit.dart';
import '../presentation/bloc/todo_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core services
  sl.registerLazySingleton<AvatarService>(() => AvatarService());

  // Data layer
  sl.registerLazySingleton<TodoRemoteDataSource>(
    () => TodoRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(remoteDataSource: sl()),
  );

  // Domain layer removed - using repository directly

  // Presentation layer
  sl.registerLazySingleton(() => AuthBloc());
  sl.registerFactory(() => LoginFormCubit(sl<AuthBloc>()));
  sl.registerFactory(() => RegisterFormCubit(sl<AuthBloc>()));
  sl.registerFactory(() => TodoBloc(authBloc: sl(), todoRepository: sl()));
}
