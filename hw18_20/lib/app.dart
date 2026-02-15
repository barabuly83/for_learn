import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';

import 'core/app_router.dart';
import 'core/avatar_service.dart';
import 'core/injection_container.dart' as di;
import 'presentation/bloc/auth_bloc.dart';
import 'presentation/bloc/login_form_cubit.dart';
import 'presentation/bloc/todo_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => di.sl<AuthBloc>()),
        BlocProvider<TodoBloc>(create: (context) => di.sl<TodoBloc>()),
        BlocProvider<LoginFormCubit>(
          create: (context) => di.sl<LoginFormCubit>(),
        ),
        Provider<AvatarService>(create: (context) => di.sl<AvatarService>()),
      ],
      child: const AppWithRouter(),
    );
  }
}

class AppWithRouter extends StatefulWidget {
  const AppWithRouter({super.key});

  @override
  State<AppWithRouter> createState() => _AppWithRouterState();
}

class _AppWithRouterState extends State<AppWithRouter> {
  AuthStateNotifier? _authNotifier;
  GoRouter? _router;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Create auth notifier when dependencies change (after providers are available)
    if (_authNotifier == null) {
      final authBloc = context.read<AuthBloc>();
      _authNotifier = AuthStateNotifier(authBloc);
      _router = AppRouter.createRouter(_authNotifier!);
    }
  }

  @override
  void dispose() {
    _authNotifier?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Show loading until router is initialized
    if (_router == null) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp.router(
      title: AppLocalizations.of(context)?.appTitle ?? 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add app localizations delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('ru'), // Default to Russian
    );
  }
}
