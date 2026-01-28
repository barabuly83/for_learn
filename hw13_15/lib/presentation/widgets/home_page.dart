import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/app_services.dart';
import '../../app/router/routes/app_screens.dart';
import '../../l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    final authService = AppServices.of(context).authService;
    final l10n = S.of(context);
    try {
      await authService.signOut();
      if (context.mounted) {
        context.go(AppScreens.login.routePath);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n?.logout_error_message(e.toString()) ??
                  'Ошибка при выходе: $e',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.main ?? 'Главная'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: l10n?.profile ?? 'Профиль',
            onPressed: () {
              context.push(AppScreens.profile.routePath);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: l10n?.logout ?? 'Выйти',
            onPressed: () => _handleLogout(context),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.quiz, size: 120, color: Colors.deepPurple),
              const SizedBox(height: 32),
              Text(
                l10n?.main ?? 'Главная',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.play_arrow, size: 28),
                  label: Text(
                    l10n?.start ?? 'Начать',
                    style: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    context.push(AppScreens.categories.routePath);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.history),
                  label: Text(
                    l10n?.quiz_history ?? 'История викторин',
                    style: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    context.push(AppScreens.results.routePath);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.person),
                  label: Text(
                    l10n?.profile ?? 'Профиль',
                    style: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    context.push(AppScreens.profile.routePath);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
