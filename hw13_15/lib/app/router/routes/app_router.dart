import 'package:go_router/go_router.dart';
import '../../../domain/models/auth_service.dart';
import '../../../presentation/widgets/home_page.dart';
import '../../../presentation/widgets/login_page.dart';
import '../../../presentation/widgets/register_page.dart';
import '../../../presentation/widgets/categories_page.dart';
import '../../../presentation/widgets/questions_page.dart';
import '../../../presentation/widgets/result_page.dart';
import '../../../presentation/widgets/profile_page.dart';
import 'app_screens.dart';
import 'go_router_refresh_stream.dart';

/// Создает роутер приложения
GoRouter createRouter(AuthService authService) => GoRouter(
      initialLocation: AppScreens.login.routePath,
      refreshListenable: GoRouterRefreshStream(authService.authStatusChanged),
      redirect: (context, state) {
        final fullPath = state.uri.path;
        final isAuthenticated = authService.isAuthenticated;
        final isAuthPath = fullPath.startsWith(AppScreens.login.routePath);

        if (!isAuthenticated && !isAuthPath) {
          return AppScreens.login.routePath;
        } else if (isAuthenticated && isAuthPath) {
          return AppScreens.home.routePath;
        }
        return null;
      },
      routes: [
        GoRoute(
          name: AppScreens.login.routeName,
          path: AppScreens.login.routePath,
          builder: (context, state) => const LoginPage(),
          routes: [
            GoRoute(
              name: AppScreens.loginRegister.routeName,
              path: AppScreens.loginRegister.routePath,
              builder: (context, state) => const RegisterPage(),
            ), // GoRoute
          ],
        ), // GoRoute
        GoRoute(
          name: AppScreens.home.routeName,
          path: AppScreens.home.routePath,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          name: AppScreens.categories.routeName,
          path: AppScreens.categories.routePath,
          builder: (context, state) => const CategoriesPage(),
        ),
        GoRoute(
          name: AppScreens.questions.routeName,
          path: AppScreens.questions.routePath,
          builder: (context, state) => QuestionsPage(state: state),
        ),
        GoRoute(
          name: AppScreens.result.routeName,
          path: AppScreens.result.routePath,
          builder: (context, state) => ResultPage(state: state),
        ),
        GoRoute(
          name: AppScreens.profile.routeName,
          path: AppScreens.profile.routePath,
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    );
