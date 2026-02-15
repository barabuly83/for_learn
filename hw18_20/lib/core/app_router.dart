import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/bloc/auth_bloc.dart';
import '../presentation/bloc/auth_state.dart';
import '../presentation/pages/add_todo_page.dart';
import '../presentation/pages/edit_todo_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/profile_page.dart';
import '../presentation/pages/register_page.dart';

/// Notifier that implements Listenable for GoRouter refreshListenable
/// Wraps AuthBloc state changes to trigger router redirects
class AuthStateNotifier extends ChangeNotifier {
  AuthStateNotifier(this._authBloc) {
    debugPrint(
      '🔄 AuthStateNotifier: Created, initial state: ${_authBloc.state.runtimeType}',
    );
    _authBloc.stream.listen((state) {
      debugPrint(
        '🔄 AuthStateNotifier: AuthBloc state changed to: ${state.runtimeType}',
      );
      notifyListeners();
    });
  }

  final AuthBloc _authBloc;

  AuthState get authState => _authBloc.state;
  bool get isAuthenticated => authState is Authenticated;
}

class AppRouter {
  AppRouter._();

  // Routes that don't require authentication
  static const List<String> _publicRoutes = ['/login', '/register'];

  // Routes that require authentication
  static const List<String> _protectedRoutes = [
    '/home',
    '/add-todo',
    '/profile',
  ];

  static GoRouter createRouter(AuthStateNotifier authNotifier) {
    return GoRouter(
      initialLocation: '/login',
      refreshListenable: authNotifier,
      redirect: (context, state) => _handleRedirect(authNotifier, state),
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

  static String? _handleRedirect(
    AuthStateNotifier authNotifier,
    GoRouterState state,
  ) {
    final isAuthenticated = authNotifier.isAuthenticated;
    final currentRoute = state.matchedLocation;
    final authState = authNotifier.authState;

    debugPrint(
      '🔀 GoRouter redirect check: authenticated=$isAuthenticated, route=$currentRoute, authState=${authState.runtimeType}',
    );

    // If user is not authenticated and trying to access protected routes
    if (!isAuthenticated && _isProtectedRoute(currentRoute)) {
      debugPrint(
        '🔀 Redirecting to /login (protected route, not authenticated)',
      );
      return '/login';
    }

    // If user is authenticated and on auth screens, redirect to home
    if (isAuthenticated && _isPublicRoute(currentRoute)) {
      debugPrint('🔀 Redirecting to /home (authenticated user on auth screen)');
      return '/home';
    }

    // If user is not authenticated and not on a public route, redirect to login
    if (!isAuthenticated && !_isPublicRoute(currentRoute)) {
      debugPrint(
        '🔀 Redirecting to /login (not authenticated, not on public route)',
      );
      return '/login';
    }

    debugPrint('🔀 No redirect needed');
    return null; // No redirect needed
  }

  // Helper method to check if a route is protected
  static bool _isProtectedRoute(String route) {
    return _protectedRoutes.any(
      (protectedRoute) => route.startsWith(protectedRoute.split(':')[0]),
    ); // Handle parameterized routes
  }

  // Helper method to check if a route is public
  static bool _isPublicRoute(String route) {
    return _publicRoutes.contains(route);
  }
}
