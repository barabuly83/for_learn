import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_router.dart';
import 'core/injection_container.dart' as di;
import 'presentation/bloc/auth_bloc.dart';
import 'presentation/bloc/auth_state.dart';
import 'presentation/bloc/todo_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => di.sl<AuthBloc>()),
        BlocProvider<TodoBloc>(create: (context) => di.sl<TodoBloc>()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          final wasAuthenticated = _isAuthenticated;
          final isNowAuthenticated = state is Authenticated;

          if (_isAuthenticated != isNowAuthenticated) {
            setState(() {
              _isAuthenticated = isNowAuthenticated;
            });
          }

          if (isNowAuthenticated && !wasAuthenticated) {
            AppRouter.router.go('/home');
          } else if (!isNowAuthenticated && wasAuthenticated) {
            AppRouter.router.go('/login');
          }
        },
        child: MaterialApp.router(
          title: 'Todo App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
