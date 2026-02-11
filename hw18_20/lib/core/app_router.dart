import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/pages/add_todo_page.dart';
import '../presentation/pages/edit_todo_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/profile_page.dart';
import '../presentation/pages/register_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/add-todo',
        name: 'add-todo',
        builder: (context, state) => const AddTodoPage(),
      ),
      GoRoute(
        path: '/edit-todo/:id',
        name: 'edit-todo',
        builder: (context, state) {
          final todoId = state.pathParameters['id']!;
          return EditTodoPage(todoId: todoId);
        },
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Ошибка: ${state.error}'))),
  );
}
